import 'package:flutter/material.dart';

import '../common/widgetslib.dart';
import '../feedback/feedback.dart';

class FaqPage extends StatefulWidget {
  @override
  FaqPageState createState() => FaqPageState();
}

class FaqPageState extends State<FaqPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),

          TabBar(
            controller: _tabController,
            indicatorColor: Colors.orange, // Set the color of the TabBar indicator
            unselectedLabelColor: Colors.black45, // Color of the unselected tab labels
            labelColor: Colors.black, // Color of the selected tab label
            tabs: [
              Tab(
                text: 'Entrepreneur',
              ),
              Tab(
                text: 'Partner',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FaqList(            // For Entrepreneurs
                  faqs: [
            FaqData(
            title: 'What is WEP?',
              dropdownItems: [
                DropdownItem('', 'The Women Entrepreneurship Platform (WEP) was launched on 8th March, 2018 on the occasion of the International Women’s Day as NITI Aayog’s flagship initiative to create a novel aggregator portal to catalyze the entrepreneurial ecosystem for women and address information asymmetry.. The is a first of its kind unified access portal designed to enable women across India to realize their entrepreneurial aspirations and gain access to resources that will not only support their journeys but also inspire aspirational entrepreneurs to follow suit. '),
                DropdownItem('', 'WEP aims to provide information for all kinds of women entrepreneurs and is not restricted to any kind of enterprise or sector.'),
              ],
            ),
            FaqData(
              title: 'When was WEP started/launched?',
              dropdownItems: [
                DropdownItem('', 'The idea of the Platform was first mooted by Shri Amitabh Kant, CEO, NITI Aayog who announced the setting-up of a platform just for Women Entrepreneurs at the conclusion of the 8th Global Entrepreneurship Summit (GES) held in Hyderabad in 2017 to help resolve the information asymmetry that exists in the ecosystem'),

              ],
            ),
            FaqData(
              title: 'How does one become a member of the WEP community?',
              dropdownItems: [
                DropdownItem('', 'To become a member of the WEP community, women entrepreneurs need to complete the registration process and create a WEP account. Click here to register. Upon successful registration on this portal, you will receive a confirmation email. This indicates your inclusion into our member rolls. This online registration is entirely free of cost and you can avail all WEP services via this login.'),
              ],
            ),
            FaqData(
                title: 'What are the modules available on WEP?',
                dropdownItems: [
                DropdownItem('Knowledge Bank:', 'The knowledge bank module allows for hosting of blogs, checklists, infographics and video guides'),
                DropdownItem('Events:', 'All WEP and partner events can be hosted on this module where users can register and express interest in enrolling'),
                DropdownItem('Community:', 'The community module on the website allows entrepreneurs to connect with fellow entrepreneurs, mentors, partners and the WEP Team. This module helps in building a robust network that women entrepreneurs can leverage in the journey of their own enterprises.'),
                DropdownItem('Recognizing Role Models(Off-line):', 'This is achieved through the Women Transforming India Awards, NITI Aayog\'s annual endeavour to recognize exceptional women changemakers in the country.'),
              ],
            ),
            FaqData(
              title: 'What are our focus areas?',
              dropdownItems: [
                DropdownItem('', 'WEP has 6 main focus areas: Community and Networking; Funding and Financial Assistance; Incubation & Acceleration; Compliance & Tax Assistance; Entrepreneur Skilling & Mentorship and Marketing Assistance'),

              ],
            ),
            FaqData(
              title: 'What WEP is doing under each of its focus areas?',
              dropdownItems: [
                DropdownItem('Community and Networking', 'Building a robust network of women entrepreneurs to enable an ecosystem of support, learning, collaboration and mentorship'),
                DropdownItem('Funding and Financial Assistance', 'Providing funding assistance and information on financial management for launch and expansion of enterprises'),
                DropdownItem('Entrepreneur Skilling and Mentorship', 'Imparting essential entrepreneurial and management skills to stimulate innovation and sustainability'),
                DropdownItem('Compliance and Tax Assistance', 'Leveraging knowledge partners for resources around taxation, audit, business licensing and regulations'),
                DropdownItem('Incubation and Acceleration', 'Connecting women to incubation and acceleration programs for speeding up the growth of startups and early stage enterprises'),
                DropdownItem('Marketing Assistance', 'Enhancing marketing capabilities & competitiveness to demonstrate the impact of prevalent market scenario on the enterprise activities'),
              ],
            ),
            FaqData(
              title: 'How can WEP help me in gaining relevant skills to run a business?',
              dropdownItems: [
                DropdownItem('', 'In its effort to become the one stop solution for women entrepreneurs, WEP has launched several online series to provide opportunities to hear from established business tycoons. Apart from an extensive online knowledge bank, WEP partnerships also extend offline capacity building workshops and programs to WEP users.'),

              ],
            ),
            FaqData(
              title: 'How do I navigate the WEP portal?',
              dropdownItems: [
                DropdownItem('', 'The WEP team has designed a walk-through to help acquaint you with our online services. Login to your WEP account and take a tour of the app using the help icon help-iconto explore our offerings'),

              ],
            ),
            FaqData(
              title: 'Can I sell my products on WEP?',
              dropdownItems: [
                DropdownItem('', 'WEP is an aggregator platform that hosts knowledge resources, programs and services relevant to Women Entrepreneurs in India. It does not promote individual businesses or products.                  You can however leverage the community module to interact with your peers to understand best practices in your'),

                  ],
                ),
                FaqData(
                  title: 'How do I contact the WEP team?',
                  dropdownItems: [
                    DropdownItem('', 'Click Here or write to wep-niti@gov.in with your queries!'),

                  ],
                ),
                FaqData(
                  title: 'Is my data safe with WEP?',
                  dropdownItems: [
                    DropdownItem('', 'Read Disclaimer'),

                      ],
                    ),
                    FaqData(
                      title: 'Does WEP create its own content for the app or provide government funding to Women entrepreneurs?',
                      dropdownItems: [
                        DropdownItem('', 'WEP is an aggregator platform that only connects industry experts, funding ventures with women entrepreneurs through online and offline channels. WEP does not create its own content or directly fund ventures.'),
                      ],
                    ),
                  ],
                ),
                FaqList(                    // For Partners
                  faqs: [
                    FaqData(
                      title: 'What is WEP?',
                      dropdownItems: [
                        DropdownItem('', 'The Women Entrepreneurship Platform (WEP) was launched on 8th March, 2018 on the occasion of the International Women’s Day as NITI Aayog’s flagship initiative to create a novel aggregator portal to catalyze the entrepreneurial ecosystem for women and address information asymmetry.. The is a first of its kind unified access portal designed to enable women across India to realize their entrepreneurial aspirations and gain access to resources that will not only support their journeys but also inspire aspirational entrepreneurs to follow suit. '),
                        DropdownItem('','WEP aims to provide information for all kinds of women entrepreneurs and is not restricted to any kind of enterprise or sector.' )
                      ],
                    ),
                    FaqData(
                      title: 'When was WEP started/launched?',
                      dropdownItems: [
                        DropdownItem('', 'The idea of the Platform was first mooted by Shri Amitabh Kant, CEO, NITI Aayog who announced the setting-up of a platform just for Women Entrepreneurs at the conclusion of the 8th Global Entrepreneurship Summit (GES) held in Hyderabad in 2017 to help resolve the information asymmetry that exists in the ecosystem'),

                      ],
                    ),
                    FaqData(
                      title: 'How does one become a member of the WEP community?',
                      dropdownItems: [
                        DropdownItem('', 'To become a member of the WEP community, women entrepreneurs need to complete the registration process and create a WEP account. Click here to register. Upon successful registration on this portal, you will receive a confirmation email. This indicates your inclusion into our member rolls. This online registration is entirely free of cost and you can avail all WEP services via this login.'),

                      ],
                    ),
                    FaqData(
                      title: 'What are the modules available on WEP?',
                      dropdownItems: [
                        DropdownItem('Knowledge Bank:', 'The knowledge bank module allows for hosting of blogs, checklists, infographics and video guides'),
                        DropdownItem('Events:', 'All WEP and partner events can be hosted on this module where users can register and express interest in enrolling'),
                        DropdownItem('Community:', 'The community module on the website allows entrepreneurs to connect with fellow entrepreneurs, mentors, partners and the WEP Team. This module helps in building a robust network that women entrepreneurs can leverage in the journey of their own enterprises.'),
                        DropdownItem('Recognizing Role Models(Off-line):', 'This is achieved through the Women Transforming India Awards, NITI Aayog\'s annual endeavour to recognize exceptional women changemakers in the country.'),
                          ],
                        ),
                        FaqData(
                          title: 'What are our focus areas?',
                          dropdownItems: [
                            DropdownItem('', 'WEP has 6 main focus areas: Community and Networking; Funding and Financial Assistance; Incubation & Acceleration; Compliance & Tax Assistance; Entrepreneur Skilling & Mentorship and Marketing Assistance'),

                          ],
                        ),

                        FaqData(
                          title: 'How do I navigate the WEP portal?',
                          dropdownItems: [
                            DropdownItem('', 'The WEP team has designed a walk-through to help acquaint you with our online services. Login to your WEP account and take a tour of the app using the help icon help-iconto explore our offerings'),

                          ],
                        ),

                        FaqData(
                          title: 'What do WEP partners do?',
                          dropdownItems: [
                            DropdownItem('', 'Partners are the pivotal agents that transform WEP’s vision to reality through incisive interventions. WEP partners with organizations with sound technical expertise across sectors to bring curated services to Women Entrepreneurs. Partners form the backbone of WEP’s ongoing efforts to make key services accessible to its users.'),

                          ],
                        ),
                        FaqData(
                          title: 'How can an interested organization initiate a partnership?',
                          dropdownItems: [
                            DropdownItem('', 'Click here(org_credentials)'),

                          ],
                        ),
                        FaqData(
                            title: 'What services do WEP\'s existing partners offer?',
                        dropdownItems: [
                        DropdownItem('DEVELOPING THE KNOWLEDGE BANK', 'Description 3'),
                        DropdownItem('CONTRIBUTING TO DISCUSSION FORUMS', 'Description 4'),
                        DropdownItem('OTHER ONLINE SERVICES', 'Description 4'),
                        DropdownItem('', 'Have another unique offering for WEP? Contact the WEP team at wep-niti@gov.in to customize the collaboration'),
                      ],
                    ),
                    FaqData(
                      title: 'What are the steps involved in coming onboard as a WEP partner?',
                      dropdownItems: [
                        DropdownItem('', '* Interested organizations fill out the Partner EoI form on the WEP Portal'),
                        DropdownItem('', '* WEP Team shortlists organizations periodically'),
                        DropdownItem('', '* Due diligence processes ensue to assess the interested organization’s alignment with WEP focus areas'),
                        DropdownItem('', '* Discussing deliverables and defining engagement metrics'),
                        DropdownItem('', '* Providing login credentials to the website along-with an orientation about its features'),
                      ],
                    ),
                    FaqData(
                      title: 'Who can partner with WEP?',
                      dropdownItems: [
                        DropdownItem('', '* Incubators & Accelerators'),
                        DropdownItem('', '* Banks & Service Providers'),
                        DropdownItem('', '* Training and Skill Development Organizations'),
                        DropdownItem('', 'Legal, Compliance and Taxation experts'),
                        DropdownItem('', 'Mentorship Programs'),
                        DropdownItem('', 'Networking and Market Access Agencies'),
                        DropdownItem('', 'Tech Innovators'),
                        DropdownItem('', 'Entrepreneur Networks and much more.'),
                      ],
                    ),
                    FaqData(
                        title: 'Who are WEP\'s current partners?',
                    dropdownItems: [
                    DropdownItem('', 'Click here(Partners)'),

                  ],
                ),
              ],
                ),
              ],
            ),
          ),
          ///////////////
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.purple[50],
              child: Footer(context, Icons.home, Icons.explore, Icons.abc, Icons.person, Feedbacks(), Feedbacks(), Feedbacks(), Feedbacks()),
            ),
          ),

          /////////////////
        ],
      ),
    );
  }
}

class FaqData {
  final String title;
  final List<DropdownItem> dropdownItems;

  FaqData({required this.title, required this.dropdownItems});
}

class DropdownItem {
  final String heading;
  final String description;

  DropdownItem(this.heading, this.description);
}

class FaqList extends StatelessWidget {
  final List<FaqData> faqs;

  FaqList({required this.faqs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        return FaqWidget(faqData: faqs[index]);
      },
    );
  }
}

class FaqWidget extends StatefulWidget {
  final FaqData faqData;

  FaqWidget({required this.faqData});

  @override
  FaqWidgetState createState() => FaqWidgetState();
}

class FaqWidgetState extends State<FaqWidget> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[50], // Set the color of the card
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          widget.faqData.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.only(left:16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.faqData.dropdownItems.map((item) {
                return Container(alignment: Alignment.centerLeft,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.heading,
                      textAlign:TextAlign.left,
                      softWrap: true,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(item.description, textAlign:TextAlign.left,
                      softWrap: true,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 16),
                  ],
                ),);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
