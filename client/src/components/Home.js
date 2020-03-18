import React from "react";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import Col from "react-bootstrap/Col";
import Form from "react-bootstrap/Form";
import Button from "react-bootstrap/Button";
import Alert from "react-bootstrap/Alert";

import axios from "axios";

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      shortUrl: "",
      originalUrl: "",
      sanitizedOriginalUrl: "",
      link: "",
      errorMessage: ""
    };
    this.handleChange = this.handleChange.bind(this);
    this.shortenUrl = this.shortenUrl.bind(this);
    this.showShortUrl = this.showShortUrl.bind(this);
  }

  handleChange(event) {
    this.setState({
      originalUrl: event.target.value,
      errorMessage: "",
      shortUrl: ""
    });
  }

  shortenUrl() {
    const postBody = {
      original_url: this.state.originalUrl
    };
    axios
      .post("/api/v1/originals/", postBody)
      .then(response => {
        this.setState({
          shortUrl: response.data.short_url,
          sanitizedOriginalUrl: response.original_url
        });
      })
      .catch(error => {
        if (error.response.status === 422) {
          this.setState({ errorMessage: "URL has already been taken" });
        } else {
          this.setState({ errorMessage: "There is an error. Please Retry." });
        }
      });
  }

  showShortUrl() {
    if (this.state.shortUrl) {
      const redirectUrl = `http://localhost:3000/go/to/${this.state.shortUrl}`;
      return (
        <Alert variant="success">
          Short: http://localhost:3000/go/to/
          <Alert.Link href={redirectUrl}>{this.state.shortUrl}</Alert.Link>
        </Alert>
      );
    }
  }

  render() {
    return (
      <Container>
        <Row>
          <Col>
            <Form className="input-form">
              <Form.Group as={Row} controlId="formOriginalUrl">
                <Form.Label>Original URL</Form.Label>
                <Form.Control
                  type="plaintext"
                  placeholder="Enter original URL"
                  value={this.state.originalUrl}
                  onChange={this.handleChange}
                />
              </Form.Group>
              <Button variant="primary" onClick={this.shortenUrl}>
                Shorten
              </Button>
              {this.showShortUrl()}
            </Form>
          </Col>
        </Row>
      </Container>
    );
  }
}

export default Home;
