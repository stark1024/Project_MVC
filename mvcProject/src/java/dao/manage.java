/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author JARVIS
 */
public class manage {
    public int insertData(Object obj){
        student std = (student) obj;
        int id = std.getId();
        String name = std.getName();
        String city = std.getCity();
        int x=0;
        try {
            Connection con=conn.myConnection.getCon();
            String s="insert into t1 values(?,?,?)";
            PreparedStatement ps=con.prepareStatement(s);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, city);
            x=ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if(x>0){
            return 1;
        }else
            return 0;
    }
    
    public Exception getException(Object obj){
        Exception e = null;
        student std = (student) obj;
        int id = std.getId();
        String name = std.getName();
        String city = std.getCity();
        try {
            Connection con=conn.myConnection.getCon();
            String s="insert into t1 values(?,?,?)";
            PreparedStatement ps=con.prepareStatement(s);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, city);
            ps.executeUpdate();
            con.close();
        } catch (Exception e1) {
            e = e1;
        }
        return e;
    }
    
    public ResultSet showData(){
        ResultSet rs = null;
        try {
            Connection con=conn.myConnection.getCon();
            String s="select * from t1";
            Statement stm=con.createStatement();
            ResultSet rst = stm.executeQuery(s);
            rs = rst;
            //rst.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return rs;
    }
    
    public int updateData(Object obj){
        student std = (student) obj;
        int id = std.getId();
        String name = std.getName();
        String city = std.getCity();
        int x=0;
        try {
            Connection con=conn.myConnection.getCon();
            String s="update t1 set name=?, city=? where id=?";
            PreparedStatement ps=con.prepareStatement(s);
            ps.setInt(3, id);
            ps.setString(1, name);
            ps.setString(2, city);
            x=ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if(x>0){
            return 1;
        }else
            return 0;
    }
    
    public student getData(int id){
        student st = null;
        try {
            Connection con=conn.myConnection.getCon();
            String s="select * from t1 where id=?";
            PreparedStatement stm=con.prepareStatement(s);
            stm.setInt(1, id);
            ResultSet rst = stm.executeQuery();
            if(rst.next()){
                student obj = new student(id, rst.getString("name"), rst.getString("city"));
                st = obj;
            }
            rst.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return st;
    }
    
    public int deleteData(int id){
        int x=0;
        try {
            Connection con=conn.myConnection.getCon();
            String s="delete from t1 where id=?";
            PreparedStatement ps=con.prepareStatement(s);
            ps.setInt(1, id);
            x=ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        if(x>0){
            return 1;
        }else
            return 0;
    }
    
    /*public static void main(String args[]){
        manage m = new manage();
        student s = m.getData(101);
        System.out.print(s.getCity()+s.getName()+s.getId());
    }*/
}
