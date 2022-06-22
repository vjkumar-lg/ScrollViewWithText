//
//  ViewController.swift
//  ScrollView
//
//  Created by vijay-pt5416 on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.alwaysBounceHorizontal = false
        return scroll
    }()
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemFill
        label.text = "Nas tdonec ndisse dolorve sellus suscipit eu sed ipsump. Nascetur sceleris diam tur aliquam vulput dolorma quat enimsed. Rhoncus disse augue congued dumin nulla oin mipraese viverr ger. Uis lobortis imperdie eroscu dis amet quamphas cras lectusa. Porttit aenean elementu tortorp acum ipsumnam nisl. Magnaqu element convall nunc enas sse atein metusd.\n\nUlum sce eratetia llam gravida laciniap. Turpis uis mus justo iain class augueph venenat leofusce ipsumnam. Uada sapienma min tfusce sque habitas amus nibhphas. Justov metussed habitant malesu tortor bibendu cras class sapienma. Eratfus luctus nam orcisusp turpisve vitaenu magnapro anunc. Potent ligula aliquam imperdie euismo neque tate enas estnunc dignis. Rrased lacus purusp oin duis eget integer uisque. Sociis consect venenat duis tate sagittis iam estnulla imperdie.\n\nLeoetiam liberoa luctus sed uris vulput fringi porttito cras nequesed. Sociis viverra iam tdonec iquam venenat teger purusp. Tur laut rfusce ivamus ultricie liberom loremn torquent auris miproin. Tortor lla sedlorem nulla ger teger himenaeo. Potent adipisci ulum itur uam tsed. Convall sodalesm suspendi faucibus lobortis erdiet orciduis porttit urient sociis. Leo ivamus telluset egestas eroscu facilisi iumsed nunccras quamin nislae.\n\nLum dictumdu ibulum consect mus lectus risusm teger unc quam. Ies uisque vulput lectusn mus sfusce oin temporin enas musetiam. Lum sque faucibus ullam llus que nunc varius bus vulput. Eroscu ullam tortorp nulla metusqui uis tur tellus sapienma odiophas. Faucibu enimphas purusp aenean ger sapienna eduis. Leopelle inceptos facili tristi ullamcor ssed sit variusma ulum. Nullap bibend sisut lus blandi malesu felis nibhcras varius. Etsed mollis nequeal bibendum eu nean dictumdu sapienna nuncves.\n\nNatis ris idnulla placerat tortorp loremnul llaut. Lobortis ipsump consequa oin orem accumsan leocras consec. Lum egestas facilisi sedin faucibus unc feugiat miproin ulum purusd. Bibendu que faucibus mnulla quis sque semnunc interdum sedinteg lectus. Aptent uis nec massased setiam isised arcualiq ulum nisimor iaculi. Felisq ipsumin sque metussed faucibus egestas. Viverr morbi que enimphas seminteg nullam. Eger felis imperdie teger dictumst auris. Arcu sfusce facilis nec laut cras leo egetal inceptos. Augue afusce iam tellus vehicula sdonec malesu volutpat eu."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0;
        label.setContentCompressionResistancePriority(UILayoutPriority(1000) , for: .vertical)
        label.setContentCompressionResistancePriority(UILayoutPriority(1000) , for: .horizontal)
        return label
    }()
    
    private let stackView2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution  = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private let acceptButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.tintColor = .white
        button.setTitle("Accept", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        return button
    }()
    
    private let declineButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.tintColor = .white
        button.setTitle("Decline", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.sizeToFit()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = label.frame.size
        scrollView.addSubview(label)
        stackView2.addArrangedSubview(declineButton)
        stackView2.addArrangedSubview(acceptButton)
        
        view.addSubview(scrollView)
        view.addSubview(stackView2)
       
        updateConstraints()
    }
    
    override func viewDidLayoutSubviews()
      {
          scrollView.contentSize = CGSize(width:self.view.frame.size.width, height: label.frame.size.height ) // set height according you
      }
    
    func updateConstraints() {
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
//        scrollView.widthAnchor.constraint(equalTo: label.widthAnchor).isActive = true
       
        label.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        stackView2.topAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 10).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

