import requests
import logging #lebreria para darle propiedades al archivo de log

def getSellerItems(seller_id, site_id):

    try:
        seller_list = requests.get(f"https://api.mercadolibre.com/sites/{site_id}/search?seller_id={str(seller_id)}")
        if seller_list.status_code != 200:
            raise requests.exceptions.InvalidURL
    except requests.exceptions.InvalidURL as e:
        print(f"Error while trying to reach the site.\nStatus code <{seller_list.status_code}> ")
        raise SystemExit(e)

    results = seller_list.json()['results']

    logging.basicConfig(level=logging.DEBUG,
                        format='%(asctime)s — %(message)s',
                        datefmt='%Y-%m-%d_%H:%M:%S',
                        handlers=[logging.FileHandler('seller_info.log', encoding='utf-8')])

    data = {}

    for i in results:

        catqry = requests.get("https://api.mercadolibre.com/categories/{}".format(i['category_id'])).json()

        data = {
            'id':i['id'],
            'title':i['title'],
            'category_id':i['category_id'],
            'name':catqry['name']
        }

        logging.info(data)

    return 0

if __name__ == "__main__":
    getSellerItems(179571326,"MLA")





