To create a new function we can leverage the OpenFaaS cli tool `faas-cli` which is available for a number of platforms such as Windows, Linux, and MacOS.

OpenFaas supports a number of languages such as Node Python, and Golang, to see all of the officialy supported templates run the command `faas-cli template pull && faas-cli new --list`{{execute}} 

You can also use a community submitted templates using the `faas-cli pull` command.  We are going to use the Golang template and create a function called `echo`.

Run the command now to create your function:
`faas-cli new -lang go echo`{{execute}}

This will create a number of files for you in the current folder:

```bash
$ tree -L 2
.
├── echo
│   └── handler.go
├── echo.yml
└── template
    ├── csharp
    ├── go
    ├── go-armhf
    ├── node
    ├── node-arm64
    ├── node-armhf
    ├── python
    ├── python-armhf
    ├── python3
    └── ruby
```

If we look at the handler.go file which contains our example function code we can see it contains a single function with a simple interface.

`vim echo/handler.go`{{execute}}

Just incase you are wondering type `:x` to quit Vim :)

The next step is to build our function and to deploy it to Nomad, before we do we need to edit the echo.yml file and change the image name so we can push the image to a docker registry.

You can push the image to your personal registry however there is also a local registry running in this environment: **[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com**

Edit the `echo.yml` file and change the gateway to our local gateway at: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/ and change the image to prefix the local registry.

`vim echo.yml`{{execute}}

You should end up with something which looks like this...

provider:  
  name: faas  
  gateway: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/  

functions:  
  echo:  
    lang: go  
    handler: ./echo  
    image: [[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com/echo  
  

Adding the gateway to our `echo.yml` allows us to deploy and invoke our functions without needing to specify the gateway flag in the command line.
