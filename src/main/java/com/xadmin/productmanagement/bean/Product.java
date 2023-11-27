package com.xadmin.productmanagement.bean;

public class Product {
	
	private int id;
	private int codProd;
	private String nome;
	private String descricao;
	private String marca;
	private int estoque;
	private double preco;
	
	public Product(int codProd, String nome, String descricao, String marca, int estoque, double preco) {
		super();
		this.codProd = codProd;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.estoque = estoque;
		this.preco = preco;
	}

	public Product(int id, int codProd, String nome, String descricao, String marca, int estoque, double preco) {
		super();
		this.id = id;
		this.codProd = codProd;
		this.nome = nome;
		this.descricao = descricao;
		this.marca = marca;
		this.estoque = estoque;
		this.preco = preco;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCodProd() {
		return codProd;
	}

	public void setCodProd(int codProd) {
		this.codProd = codProd;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public int getEstoque() {
		return estoque;
	}

	public void setEstoque(int estoque) {
		this.estoque = estoque;
	}

	public double getPreco() {
		return preco;
	}

	public void setPreco(double preco) {
		this.preco = preco;
	}
}
