from fastapi import FastAPI                                                                                    
  
app = FastAPI(title="DevSecOps API")

@app.get("/")
def read_root():
    return {"message": "DevSecOps CI/CD Pipeline API", "status": "running"}                                    

@app.get("/health")
def health_check():
    return {"status": "ok"}