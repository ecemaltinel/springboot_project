package productProject.web;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "product")
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Size(min = 3 , max = 100)
	@Column(name = "product_name")
	private String productName;
	
	@Max(value = 10000)
	@Min(value = 100)
	@Column(name = "sales_price")
	private double salesPrice;
	
	@Past
	@DateTimeFormat(pattern = "dd.MM.yyyy")
	@Column(name = "production_date")
	private LocalDate productionDate;

	@NotEmpty
	@Column(name = "availability")
	private String availability;
	
	@OneToMany(mappedBy = "product")
	@OrderBy("id")
	private Set<Accessory> accessories = new HashSet<>();
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(double salesPrice) {
		this.salesPrice = salesPrice;
	}
	public LocalDate getProductionDate() {
		return productionDate;
	}
	public void setProductionDate(LocalDate productionDate) {
		this.productionDate = productionDate;
	}
	public Set<Accessory> getAccessories() {
		return accessories;
	}
	public void setAccessories(Set<Accessory> accessories) {
		this.accessories = accessories;
	}

	public String getAvailability() {
		return availability;
	}
	public void setAvailability(String availability) {
		this.availability = availability;
	}


	
	

}
