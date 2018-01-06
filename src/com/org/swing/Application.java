package com.org.swing;


import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTree;
import javax.swing.table.DefaultTableModel;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeModel;
import javax.swing.tree.TreeNode;

public class Application extends JFrame {

	DefaultMutableTreeNode emptyRootNode;
	DefaultMutableTreeNode enteredurl;
	DefaultTableModel dtm;
	List<DefaultMutableTreeNode> def = new ArrayList<>();
	JTable table;
	int count = 0;
	String path2 = "o";

	Object rows[][] = { { "url", "responsecode", "response" } };
	Object headers[] = { "URl", "Response Code", "Response" };

	public Application() {

		pane = new JEditorPane();
		pane.setEditable(true);
		dtm = new DefaultTableModel(0, 0);
		dtm.setColumnIdentifiers(headers);

		getContentPane().add(new JScrollPane(pane), "Center");

		JPanel panel = new JPanel();
		panel.setLayout(new GridBagLayout());

		table = new JTable();
		table.setModel(dtm);
		table.setPreferredScrollableViewportSize(new Dimension(500, 100));
		getContentPane().add(new JScrollPane(table), BorderLayout.SOUTH);

		emptyRootNode = new DefaultMutableTreeNode("Enteredurls");
		emptyModel = new DefaultTreeModel(emptyRootNode);
		tree = new JTree(emptyModel);
		tree.setPreferredSize(new Dimension(200, 200));
		getContentPane().add(new JScrollPane(tree), "West");

		GridBagConstraints c = new GridBagConstraints();
		c.gridwidth = 1;
		c.gridheight = 1;
		c.anchor = GridBagConstraints.NORTHWEST;
		c.fill = GridBagConstraints.HORIZONTAL;
		c.weightx = 0.50;
		c.weighty = 0.0;

		 final JLabel urlLabel = new JLabel("URL: ", JLabel.RIGHT);
		panel.add(urlLabel, c);
		c.gridy = 3;
		c.gridwidth = 2;
		c.weightx = 1.0;
		c.anchor = GridBagConstraints.EAST;

		onlineLoad = new JCheckBox("Online Load");
		panel.add(onlineLoad, c);
		onlineLoad.setSelected(true);
		c.gridx = 3;
		c.gridy = 1;
		c.anchor = GridBagConstraints.SOUTH;
		c.fill = GridBagConstraints.HORIZONTAL;

		urlCombo = new JComboBox();
		panel.add(urlCombo, c);
		urlCombo.setEditable(true);
		getContentPane().add(panel, "North");

		ClassLoader loader = getClass().getClassLoader();
		if (loader != null) {
			JEditorPane.registerEditorKitForContentType("text/html", "HiddenViewHTML", loader);
		}

		urlCombo.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent evt) {
				Object selection = urlCombo.getSelectedItem();
				loadNewPage(selection);
				count++;
				if (!(path2.equals(selection.toString()))) {

					HttpURLConnection con;
					try {
						URL urls = new URL((String) selection);
						con = (HttpURLConnection) urls.openConnection();
						String responseHeader = con.getHeaderField(null);
					//	int responsecode = con.getResponseCode();
					//	String responsecode = con.getContentType();
						Object responsecode =urlLabel;
						//Object load= loader;
						//Object page = loader;
					//	Object page = toString();
					//	if (page instanceof URL) {
					//	} else {
					//	}

						//	String responsecode = page.toString();
						//String responsecode ;
						//responsecode.
						
						enteredurl = new DefaultMutableTreeNode(selection);
						path2 = selection.toString();
						emptyRootNode.add(enteredurl);
						dtm.addRow(new Object[] { selection.toString(),  responsecode, responseHeader });
					//	dtm.addRow(new Object[] { selection.toString(),  responseHeader });

					} catch (IOException e) {
						e.printStackTrace();
					}

				}
			}
		});
	}

	public void loadNewPage(Object page) {
		try {
			URL url;
			if (page instanceof URL) {
				url = (URL) page;
			} else {
				url = new URL((String) page);
			}
			urlCombo.setEnabled(true);
			DefaultTreeModel model = (DefaultTreeModel) tree.getModel();
			model.reload();
			tree.expandRow(0);

			if (onlineLoad.isSelected()) {
				pane.setPage(url);
			} else {
				pane.setContentType("text/html");

			}
		} catch (Exception e) {
			System.out.println(e);
			JOptionPane.showMessageDialog(pane, new String[] { "Unable to open file", page.toString() },
					"File Open Error", JOptionPane.ERROR_MESSAGE);
		}

	}

	public static void main(String[] args) {

		JFrame frame = new Application();
		frame.setSize(500, 400);
		frame.setVisible(true);
	}

	private JEditorPane pane;

	private JComboBox urlCombo;

	private JCheckBox onlineLoad;

	private JTree tree;

	private TreeModel emptyModel;
	
	private static TreeNode getNodes(DefaultMutableTreeNode parent, int i) {
	    if (i > 0) {
	      for (int j = 0; j < 5; j++) {
	        DefaultMutableTreeNode newChild = new DefaultMutableTreeNode(
	            "<html>Node "
	                + (j + 1)
	                + " <a href=\"http://www.java2s.com\">java2s.com</a></html> and text");
	        getNodes(newChild, i - 1);
	        parent.add(newChild);
	      }
	    }
	    return parent;
	  }

}

