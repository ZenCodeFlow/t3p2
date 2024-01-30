import requests

def fetch_spells():
    url = "https://hp-api.onrender.com/api/spells"
    response = requests.get(url)
    if response.status_code == 200:
        spells = response.json()
        print("Fetched spells:", spells)
        print("Number of spells:", len(spells))  # Count the number of spells
    else:
        print("Failed to fetch spells")

if __name__ == "__main__":
    fetch_spells()



