package productProject.web;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class ProductProjectService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private AccessoryRepository accessoryRepository;
	
	
	
	public void createProduct(Product product) {
		productRepository.create(product);
	}
	
	public void createAccessory(Accessory accessory) {
		accessoryRepository.create(accessory);
	}
	
	public void deleteProduct(long id) {
		accessoryRepository.deleteByProductId(id);
		productRepository.delete(id);
	}
	
	public void deleteAccessory(long id) {
		accessoryRepository.delete(id);
	}
	
	public List<Product> findAllProducts(){
		return productRepository.findAll();
	}
	
	public Product findProductById(long id) {
		return productRepository.findById(id);
	}

	public void update(Product product) {
		productRepository.update(product);
	}

	

}
