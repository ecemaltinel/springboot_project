package productProject.web;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Product> findAll(){
		return entityManager.createQuery("from Product" , Product.class).getResultList();
	}
	
	public Product findById(long id) {
		return entityManager.find(Product.class, id);
	}
	
	public void create(Product product) {
		entityManager.persist(product);
	}
	
	public void delete(long id) {
		entityManager.remove(entityManager.getReference(Product.class, id));
	}
	
	public void update(Product product) {
		entityManager.merge(product);
	}


}
