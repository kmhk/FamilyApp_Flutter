import 'package:family/Compnents/SizBox/SizBox.dart';
import 'package:family/Compnents/Widgets/IconButton_widgets/Back_IconButton.dart';
import 'package:family/Compnents/Widgets/Text_widgets/medium_text.dart';
import 'package:flutter/material.dart';
class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0,right: 30.0, left: 30.0, bottom: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Back_IconButton(),
                      Padding(
                        padding: const EdgeInsets.only(right:25.0, bottom: 10),
                        child: medium_text(
                          text: 'الاحكام و الشروط',
                        ),
                      ),
                    ],
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            'سياسة الخصوصيه لطبيق اسر ستيشن المنتجين'
                                '\nتعريف المصطلحات'
                                '\n١- المنتجين ويقصد بها ( الاشخاص الذين يقومون بعرض منتجاتهم سواء ذكور او اناث) '
                                '\n٢- المنتجات ويقصد بها ( جميع الاطعمه او المشروبات)'
                                '\n٣- نحن او لنا ويقصد بها ( العاملين  ومشغلين التطبيق)'
                                '\n٤- العملاء ويقصد لها (الاشخاص سواء ذكور او اناث ويرغبون لشراء او مشاهدة المنتجات) ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF707070),

                              ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            '(انت الان تستخدم تطبيق اسر ستيشن خاص بالمنتجين)',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'تعريف تطبيق اسر ستيشن الخاص بالمنتجين '
                                '\nهو تطبيق خاص فقط بلاشخاص الراغبين في عرض منتجاتهم ) ولا يحق له الاستخدام في اي غرض اخر . ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'ماهي الخدمات التي يقدمها التطبيق '
                                '\nهو تطبيق خاص فقط بلاشخاص الراغبين في عرض منتجاتهم ) ولا يحق له الاستخدام في اي غرض اخراستقبال صور وبيانات المنتجات من المنتجين لتحويلها لتطبيق اسر ستيشن العملاء لعرضها على العملا الراغبين في الحصول على اغذيه ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'حفظ البيانات الخاص بالمنتجين'
                                '\nيتم حفظ البيانات للمنتجين وعدم افشاء المعلومات او تسريبها نهائياً الا في حالة وجود خلل فني لاسمح الله',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'جميع البيانات الشخصيه وبيانات الاطعمه تكون مسؤوليتها مسؤليه كامله على المنتجين وفي حالة اي خطاء يتحمل الشخص تبعيات هذا الخطاء',style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'ماهي مسؤلية المنتجين'
                            '\n- ١- توفير جميع الاطعمه والمشروبات المعروضه في حسابه للعملاء خلال المده المتفق عليها '
                                '\n٢- جميع المنتجات المعروضه لا يكون من مكوناتها ما يخالف شرع الله او مخالف لانظمة المملكه العربيه السعوديه وخلاف ذلك يتحمل المنتجات تبعية هذه المخالفه'
                                '\n٢- جميع المنتجات المعروضه لا يكون من مكوناتها ما يخالف شرع الله او مخالف لانظمة المملكه العربيه السعوديه وخلاف ذلك يتحمل المنتجات تبعية هذه المخالفه'
                                '\n٣- تحصيل المبالغ تكون من مسولية المنتجين لان العاملين بالطبيق لا يحق لهم استلام اي مبلغ من العملاء او المنتجين ',
                            style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF707070),

                          ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'ماهي مسؤليات التي يتحملها التطبيق او العاملين فيه '
                                '\n١- مسؤليه التطبيق فقط عرض المنتجات للعملاء من خلال تطبيق استر ستيشن العملاء '
                                '\n٢- التطبيق يخلى مسوليتة في عدم حضور العميل لاستلام الطلب وكذلك في حالة ان العميل لم يدفع قيمة المنتج .'
                                '\n٣- التطبيق يخلى مسؤليته في حالة وجود خلل فني خارج عن السيطره ',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                          SizBox(
                            h: 10,
                          ),
                          Text(
                            'يحق لتطبيق تعديل سياسة الخصوصيه دون اخذ الموافقه من المنتجين',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF707070),

                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
