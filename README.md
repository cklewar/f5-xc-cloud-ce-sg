# CLOUD CE SG

Terraform to create F5XC cloud CE mandatory SGs

##  Generate prefixes

[![asciicast](https://asciinema.org/a/pxDHGv3BOkdR2jFC2Gyh7C729.svg)](https://asciinema.org/a/pxDHGv3BOkdR2jFC2Gyh7C729)

## Usage

- Clone this repo with `git clone --recurse-submodules https://github.com/cklewar/f5-xc-cloud-ce-sg`
- Enter repository directory with `cd f5-xc-cloud-ce-sg`
- Obtain F5XC API certificate file from Console and save it to `cert` directory
- Pick and choose from below examples and add mandatory input data and copy data into file `main.tf.example`.
- Rename file __main.tf.example__ to __main.tf__ with `rename main.tf.example main.tf`
- Change backend settings in `versions.tf` file to fit your environment needs
- Initialize with `terraform init`
- Apply with `terraform apply -auto-approve` or destroy with `terraform destroy -auto-approve`




## Cloud CE SG module usage example
  
````hcl
````