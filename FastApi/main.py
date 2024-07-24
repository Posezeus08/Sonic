from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/poet/{letter}")
async def get_poet(letter: str):
    if len(letter) != 1 or not letter.isalpha():
        raise HTTPException(status_code=400, detail="Invalid input. Please provide a single English letter.")
    
    async with httpx.AsyncClient() as client:
        response = await client.get("https://poetrydb.org/author")
        if response.status_code != 200:
            raise HTTPException(status_code=500, detail="Error fetching poets from the backend API")
        
        authors = response.json()["authors"]
        
        matching_poets = [author for author in authors if author.split()[0][0].lower() == letter.lower()]
        
        if not matching_poets:
            raise HTTPException(status_code=404, detail=f"No poet found with a first name starting with '{letter}'")
        
        return {"poet": matching_poets[0]}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)


##To access API in your browser 
##    http://localhost:8000/poet/{letter}