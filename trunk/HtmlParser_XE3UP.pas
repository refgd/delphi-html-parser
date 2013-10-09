{
  Html������.
  �����Ϊ�õ�Html��������.���������˼���Delphi�汾��,������ֽ������ӵ�HTML����һЩ����.
  û�취�Լ�д��һ��,�����Ե�����û�����κν������˵�Html.

  wr960204 ��ϡ�� 2013

  http://www.raysoftware.cn/?p=370

  ��лţ����������HTML�﷨��CSS�﷨����İ���.
  Thank Yang Yanzhe.

  http://www.pockhero.com/

}
unit HtmlParser_XE3UP;

interface

uses
  SysUtils, generics.Collections;

type
{$IFNDEF MSWINDOWS}
  WideString = String;
{$ENDIF}
  IHtmlElement = interface;
  IHtmlElementList = interface;
  TEnumAttributeNameCallBack = function(AParam: Pointer;
    const AttributeName, AttributeValue: WideString): Boolean; stdcall;
  TFilterElementCallBack = function(AParam: Pointer; AElement: IHtmlElement)
    : Boolean; stdcall;

  IHtmlElement = interface
    ['{8C75239C-8CFA-499F-B115-7CEBEDFB421B}']
    function GetOwner: IHtmlElement; stdcall;
    function GetTagName: WideString; safecall;
    function GetContent: WideString; safecall;
    function GetOrignal: WideString; safecall;
    function GetChildrenCount: Integer; stdcall;
    function GetChildren(Index: Integer): IHtmlElement; stdcall;
    function GetCloseTag: IHtmlElement; stdcall;
    function GetInnerHtml(): WideString; safecall;
    function GetOuterHtml(): WideString; safecall;
    function GetInnerText(): WideString; safecall;

    function GetAttributes(Key: WideString): WideString; safecall;

    function GetSourceLineNum(): Integer; stdcall;
    function GetSourceColNum(): Integer; stdcall;

    // �����Ƿ����
    function HasAttribute(AttributeName: WideString): Boolean; stdcall;
    // ���ҽڵ�
    { FindElements('Link','type="application/rss+xml"')
      FindElements('','type="application/rss+xml"')
    }
    function FindElements(ATagName: WideString; AAttributes: WideString;
      AOnlyInTopElement: Boolean): IHtmlElementList; stdcall;
    { ��CSSѡ�����﷨����Element,��֧��"α��"
      CSS Selector Style search,not support Pseudo-classes.

      http://www.w3.org/TR/CSS2/selector.html
    }
    function SimpleCSSSelector(const selector: WideString)
      : IHtmlElementList; stdcall;
    // ö������
    procedure EnumAttributeNames(AParam: Pointer;
      ACallBack: TEnumAttributeNameCallBack); stdcall;

    property TagName: WideString read GetTagName;
    property ChildrenCount: Integer read GetChildrenCount;
    property Children[index: Integer]: IHtmlElement read GetChildren; default;
    property CloseTag: IHtmlElement read GetCloseTag;
    property Content: WideString read GetContent;
    property Orignal: WideString read GetOrignal;
    property Owner: IHtmlElement read GetOwner;
    // ��ȡԪ����Դ�����е�λ��
    property SourceLineNum: Integer read GetSourceLineNum;
    property SourceColNum: Integer read GetSourceColNum;
    //
    property InnerHtml: WideString read GetInnerHtml;
    property OuterHtml: WideString read GetOuterHtml;
    property InnerText: WideString read GetInnerText;

    property Attributes[Key: WideString]: WideString read GetAttributes;
  end;

  IHtmlElementList = interface
    ['{8E1380C6-4263-4BF6-8D10-091A86D8E7D9}']
    function GetCount: Integer; stdcall;
    function GetItems(Index: Integer): IHtmlElement; stdcall;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: IHtmlElement read GetItems; default;
  end;

function ParserHTML(const Source: WideString): IHtmlElement; stdcall;

implementation

function ParserHTML(const Source: WideString): IHtmlElement; stdcall;
begin

end;

end.
