package productProject.web;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
@Table(name = "accessory")
public class Accessory {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Size(max = 50 , min = 3)
	private String accessoryName;

	@NotEmpty
	private String guarantee;
	
	@ManyToOne
	@JoinColumn(name = "productid")
	private Product product;
	
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public String getAccessoryName() {
		return accessoryName;
	}
	public void setAccessoryName(String accessoryName) {
		this.accessoryName = accessoryName;
	}
	public String getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}
}
