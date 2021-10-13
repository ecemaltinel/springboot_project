package productProject.web;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

@Repository
public class AccessoryRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public List<Accessory> findAll(){
		return entityManager.createQuery("from Accessory" , Accessory.class).getResultList();
	}
	
	public Accessory findById(long id) {
		return entityManager.find(Accessory.class , id);
	}
	
     public List<Accessory> findByProductId(long id){
		return entityManager.createQuery("from Accessory where product.id = :id" , Accessory.class).setParameter("id", id).getResultList();
	}
	
	public void create(Accessory accessory) {
		entityManager.persist(accessory);
	}
	
	public void delete(long id) {
		entityManager.remove(entityManager.getReference(Accessory.class, id));
	}
	
	public void deleteByProductId(long id) {
		entityManager.createQuery("delete from Accessory where product.id = :id").setParameter("id", id).executeUpdate();
	}
}
