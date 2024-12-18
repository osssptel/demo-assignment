## Summary
Deploy an Amazon Elastic Kubernetes Service (EKS) cluster on AWS using Terraform, and deploy Apache Airflow on this EKS cluster using ArgoCD.

## Steps
- Clone this repo to local.
- Review `terraform.tfvars` and adjust the value accordingly.
- `terraform init`
- `terraform plan`. Or `terraform show demo.tfplan` to check the plan output.
- `terraform apply`. This will create an EKS and all the required resources. Follow by ArgoCD and Airflow via ArgoCD Application in default project. 
- `terraform destroy`

## Screen reference
<div style="position: relative; display: block; margin-bottom: 20px; width: fit-content;">
  <div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); background-color: rgba(0, 0, 0, 0.5); color: white; padding: 5px 10px; font-size: 16px; text-align: center; white-space: nowrap;">
    EKS cluster created
  </div>
  <img src="/assets/node-groups-ready.jpg" style="display: block; width: 700px; height: 300px;">
  <p></p>
</div>

<div style="position: relative; display: block; margin-bottom: 20px; width: fit-content;">
  <div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); background-color: rgba(0, 0, 0, 0.5); color: white; padding: 5px 10px; font-size: 16px; text-align: center; white-space: nowrap;">
    ArgoCD deployed
  </div>
  <img src="/assets/argocd-ready.jpg" style="display: block; width: 700px; height: 500px;">
  <p></p>
</div>

<div style="position: relative; display: block; margin-bottom: 20px; width: fit-content;">
  <div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); background-color: rgba(0, 0, 0, 0.5); color: white; padding: 5px 10px; font-size: 16px; text-align: center; white-space: nowrap;">
    Airflow deployed with examples loaded
  </div>
  <img src="/assets/airflow-ready-with-examples-loaded.jpg" style="display: block; width: 900px; height: 700px;">
  <p></p>
</div>