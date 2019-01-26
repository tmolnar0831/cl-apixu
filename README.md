# cl-apixu
APIXU Common Lisp API client

## Usage

The `apixu-query` function defaults to the JSON current weather, the location is the only mandatory parameter:

```
Function: apixu-query (location &optional (uri (combine-uri)))
```

The URI can be modified by the `combine-uri` function:

```
Function: combine-uri (&key (api-uri *api-uri*)
                      (api-version *api-version*)
                      (api-method *api-method*)
                      (api-format *api-format*))
```

## Limitations

Currently only the JSON API is supported. If someone needs it, later I can develop the XML version as well.

## License

Copyright (c) 2018-2019. Tamas Molnar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
