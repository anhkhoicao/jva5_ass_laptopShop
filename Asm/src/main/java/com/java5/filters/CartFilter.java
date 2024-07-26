package com.java5.filters;

import java.io.IOException;



import org.springframework.beans.factory.annotation.Autowired;

import com.java5.services.ShoppingCartService;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebFilter(urlPatterns = "/*")
public class CartFilter extends HttpFilter {
	
	private static final long serialVersionUID = 1L;

	@Autowired
	ShoppingCartService cart;
	
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		request.setAttribute("cartAmount", cart.getAmount());
		request.setAttribute("cartQuantity", cart.getCount());
		chain.doFilter(request, response);
	}
}
