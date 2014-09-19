Return-Path: <btv1==33924f8bcc2==Matt.Schuckmann@planar.com>
Received: from barbvt10.planar.com (mail.planar.com [199.244.172.52])
	by arago-project.org (Postfix) with ESMTP id 23B9D5298D
	for <meta-arago@arago-project.org>;
	Fri, 19 Sep 2014 20:04:52 +0000 (UTC)
X-ASG-Debug-ID: 1411157087-04b02b738441c850001-NloGV9
Received: from msxbvt03.planar.net ([172.16.0.147]) by barbvt10.planar.com
	with ESMTP id dizx8HD6IJ38bH7s; Fri, 19 Sep 2014 13:04:47 -0700 (PDT)
X-Barracuda-Envelope-From: Matt.Schuckmann@planar.com
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Fri, 19 Sep 2014 13:04:47 -0700
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Date: Fri, 19 Sep 2014 13:04:46 -0700
Thread-Topic: [meta-arago] Arago build fails if building srcipk is disabled
X-ASG-Orig-Subj: RE: [meta-arago] Arago build fails if building srcipk is
	disabled
Thread-Index: Ac/Tg9hV8S3+HpktQnWrE2QbV99qEwAL/l+AAAJzV4AAIEvWfgABIvzQ
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FD8728062@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>,
	<4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
	<B0581B5571079145BA1CD78C126DBDE73210792F@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE73210792F@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[172.16.0.147]
X-Barracuda-Start-Time: 1411157087
X-Barracuda-URL: http://10.10.111.112:8000/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at planar.com
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
	SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
	QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0
	tests=BSF_SC0_MISMATCH_TO, HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.9661
	Rule breakdown below
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	0.00 BSF_SC0_MISMATCH_TO    Envelope rcpt doesn't match header
	0.00 HTML_MESSAGE           BODY: HTML included in message
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Arago build fails if building srcipk is disabled
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 20:04:52 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4B07ADD556F70043925DA2E9C5D4346D2FD8728062MSXBEBVT12pla_"

--_000_4B07ADD556F70043925DA2E9C5D4346D2FD8728062MSXBEBVT12pla_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Assuming that this is bash script, which I'm pretty sure it is, the {} are =
not required here. In bash {} are used to separate an identifier from surro=
unding text (i.e. ${CREATE_SRCIPK}_foo_bar, without the {} bash would look =
for the variable $CREATE_SRCIPK_foo_bar

I get the same error regardless if the {} are there are not.

The correct way appears to be
if [ -n "${CREATE_SRCIPK}" ] && [ "${CREATE_SRCIPK}" !=3D "0" ]

I've got a patch that does this for the 2 files that call sourceipk_do_crea=
te_srcipk directly, I'm not sure if I should send the patch it to this list=
 or ? I'm kind of new to this.

Thanks,
Matt S.

PS. I was wondering if it would be better to use the IRC channel for this k=
ind of stuff?

From: Dmytriyenko, Denys [mailto:denys@ti.com]
Sent: Friday, September 19, 2014 12:21 PM
To: Matt Schuckmann
Cc: meta-arago@arago-project.org
Subject: RE: [meta-arago] Arago build fails if building srcipk is disabled

Looks like you forgot curly brackets in the variable... Try copying the cod=
e I linked before as is - that should work, but I didn't try it myself yet,=
 due to traveling...


Sent from my Android phone using TouchDown (www.nitrodesk.com<http://www.ni=
trodesk.com>)

-----Original Message-----
From: Matt Schuckmann [Matt.Schuckmann@planar.com]
Received: Thursday, 18 Sep 2014, 15:56
To: Dmytriyenko, Denys [denys@ti.com]
CC: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org> [meta=
-arago@arago-project.org]
Subject: RE: [meta-arago] Arago build fails if building srcipk is disabled


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, September 18, 2014 2:46 PM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
> Subject: Re: [meta-arago] Arago build fails if building srcipk is
> disabled
>
> On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:
> > I've been chasing this for a bit and I think I've almost got it
> figured out.
> > I've been trying to create a new DISTRO based on Arago and I keep
> getting the following error.
> >
> > /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-
> toolch
> > ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-
> r22e+git
> > rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:
> > sourceipk_do_create_srcipk: command not found
> >
> > I finally figured out that if I included arago-source-ipk.conf in my
> DISTRO file the error goes away.
> > My understanding is that arago-source-ipk.conf turns on creating
> srcipk packages for all the packages included in the SDK. I'm not
> interested in creating srcipk's (at least I don't think I am) since I'm
> not trying to create an SDK I just want a deployable image.
> >
> > Digging a little deeper I found that meta-arago-distro/recipes-
> kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a
> do_compile_prepend() function to pick up any changes to the
> configuration file and then rebuild the srcipk.
> >
> > I think that the do_compile_prepend() function should test the value
> of one of the CREATE_SRCIPK_* variables before it tries to call
> sourceipk_do_create_srcipk, I'm just not sure which one.
> > I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not sure
> or maybe it should test multiple variables?
> >
> > I'd appreciate any guidance.
>
> Matt,
>
> So, the arago-source-ipk.conf defines which components need to create
> srcipk packages, but it also inherits the sourceipk.bbclass which
> provides the necessary sourceipk_do_create_srcipk() function. The first
> thing that function does is it checks whether CREATE_SRCIPK variable is
> defined and doesn't do anything if it's not.
>
> So, it appears that copy-defconfig.inc should not directly try to call
> that function because it makes the assumption that sourceipk.bbclass is
> always inherited. Simplest workaround would be to check for
> CREATE_SRCIPK variabe before calling that function, but I wonder if
> there's a better solution...
>
> --

Denys,
Being new to this I can't really answer the question if there is a better w=
ay.
I would like to know the proper way to check for CREATE_SRCIPK so that I ca=
n move on from this.
This seems to work but I do not have a high degree of confidence that I got=
 it correct, seems like the value should be checked too.

do_compile_prepend() {
    if [ -n "$CREATE_SRCIPK" ]
    then
        cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
        sourceipk_do_create_srcipk
    fi
}

Matt S.

PS.
I did notice that there is one other recipe doing something similar
./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18x=
x_r8.a9.14.bb

> Denys

--_000_4B07ADD556F70043925DA2E9C5D4346D2FD8728062MSXBEBVT12pla_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type content=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Assuming =
that this is bash script, which I&#8217;m pretty sure it is, the {} are not=
 required here. In bash {} are used to separate an identifier from surround=
ing text (i.e. ${CREATE_SRCIPK}_foo_bar, without the {} bash would look for=
 the variable $CREATE_SRCIPK_foo_bar<o:p></o:p></span></p><p class=3DMsoNor=
mal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";colo=
r:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'=
font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>I get th=
e same error regardless if the {} are there are not. <o:p></o:p></span></p>=
<p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorma=
l><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:=
#1F497D'>The correct way appears to be<o:p></o:p></span></p><p class=3DMsoN=
ormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";co=
lor:#1F497D'>if [ -n &quot;${CREATE_SRCIPK}&quot; ] &amp;&amp; [ &quot;${CR=
EATE_SRCIPK}&quot; !=3D &quot;0&quot; ]<o:p></o:p></span></p><p class=3DMso=
Normal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";c=
olor:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=
=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>I&#8=
217;ve got a patch that does this for the 2 files that call sourceipk_do_cr=
eate_srcipk directly, I&#8217;m not sure if I should send the patch it to t=
his list or ? I&#8217;m kind of new to this. <o:p></o:p></span></p><p class=
=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-se=
rif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'=
>Thanks,<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size=
:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>Matt S. <o:p></o:=
p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;font-fami=
ly:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span></p><p cla=
ss=3DMsoNormal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-=
serif";color:#1F497D'>PS. I was wondering if it would be better to use the =
IRC channel for this kind of stuff? <o:p></o:p></span></p><p class=3DMsoNor=
mal><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";colo=
r:#1F497D'><o:p>&nbsp;</o:p></span></p><div style=3D'border:none;border-lef=
t:solid blue 1.5pt;padding:0in 0in 0in 4.0pt'><div><div style=3D'border:non=
e;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in'><p class=3DMsoN=
ormal><b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans-serif"'=
>From:</span></b><span style=3D'font-size:10.0pt;font-family:"Tahoma","sans=
-serif"'> Dmytriyenko, Denys [mailto:denys@ti.com] <br><b>Sent:</b> Friday,=
 September 19, 2014 12:21 PM<br><b>To:</b> Matt Schuckmann<br><b>Cc:</b> me=
ta-arago@arago-project.org<br><b>Subject:</b> RE: [meta-arago] Arago build =
fails if building srcipk is disabled<o:p></o:p></span></p></div></div><p cl=
ass=3DMsoNormal><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal style=3D'mar=
gin-bottom:12.0pt'><span style=3D'font-size:11.0pt;font-family:"Calibri","s=
ans-serif";color:black'>Looks like you forgot curly brackets in the variabl=
e... Try copying the code I linked before as is - that should work, but I d=
idn't try it myself yet, due to traveling...<br><br><br>Sent from my Androi=
d phone using TouchDown (<a href=3D"http://www.nitrodesk.com">www.nitrodesk=
.com</a>)<br><br>-----Original Message----- <br><b>From:</b> Matt Schuckman=
n [Matt.Schuckmann@planar.com]<br><b>Received:</b> Thursday, 18 Sep 2014, 1=
5:56<br><b>To:</b> Dmytriyenko, Denys [denys@ti.com]<br><b>CC:</b> <a href=
=3D"mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a> [=
meta-arago@arago-project.org]<br><b>Subject:</b> RE: [meta-arago] Arago bui=
ld fails if building srcipk is disabled<o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span style=3D'font-size:10.0pt'><br><br>&gt; -----Origin=
al Message-----<br>&gt; From: Denys Dmytriyenko [<a href=3D"mailto:denys@ti=
.com">mailto:denys@ti.com</a>]<br>&gt; Sent: Thursday, September 18, 2014 2=
:46 PM<br>&gt; To: Matt Schuckmann<br>&gt; Cc: <a href=3D"mailto:meta-arago=
@arago-project.org">meta-arago@arago-project.org</a><br>&gt; Subject: Re: [=
meta-arago] Arago build fails if building srcipk is<br>&gt; disabled<br>&gt=
; <br>&gt; On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:=
<br>&gt; &gt; I've been chasing this for a bit and I think I've almost got =
it<br>&gt; figured out.<br>&gt; &gt; I've been trying to create a new DISTR=
O based on Arago and I keep<br>&gt; getting the following error.<br>&gt; &g=
t;<br>&gt; &gt; /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-li=
naro-<br>&gt; toolch<br>&gt; &gt; ain/work/zanziboard-oe-linux-gnueabi/linu=
x-ti-staging/3.14.17-<br>&gt; r22e+git<br>&gt; &gt; rAUTOINC+1ef37cd35d-ara=
go1/temp/run.do_compile.28819: line 105:<br>&gt; &gt; sourceipk_do_create_s=
rcipk: command not found<br>&gt; &gt;<br>&gt; &gt; I finally figured out th=
at if I included arago-source-ipk.conf in my<br>&gt; DISTRO file the error =
goes away.<br>&gt; &gt; My understanding is that arago-source-ipk.conf turn=
s on creating<br>&gt; srcipk packages for all the packages included in the =
SDK. I'm not<br>&gt; interested in creating srcipk's (at least I don't thin=
k I am) since I'm<br>&gt; not trying to create an SDK I just want a deploya=
ble image.<br>&gt; &gt;<br>&gt; &gt; Digging a little deeper I found that m=
eta-arago-distro/recipes-<br>&gt; kernel/linux/copy-defconfig.inc calls sou=
rceipk_do_create_srcipk in a<br>&gt; do_compile_prepend() function to pick =
up any changes to the<br>&gt; configuration file and then rebuild the srcip=
k.<br>&gt; &gt;<br>&gt; &gt; I think that the do_compile_prepend() function=
 should test the value<br>&gt; of one of the CREATE_SRCIPK_* variables befo=
re it tries to call<br>&gt; sourceipk_do_create_srcipk, I'm just not sure w=
hich one.<br>&gt; &gt; I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging=
 but I'm not sure<br>&gt; or maybe it should test multiple variables?<br>&g=
t; &gt;<br>&gt; &gt; I'd appreciate any guidance.<br>&gt; <br>&gt; Matt,<br=
>&gt; <br>&gt; So, the arago-source-ipk.conf defines which components need =
to create<br>&gt; srcipk packages, but it also inherits the sourceipk.bbcla=
ss which<br>&gt; provides the necessary sourceipk_do_create_srcipk() functi=
on. The first<br>&gt; thing that function does is it checks whether CREATE_=
SRCIPK variable is<br>&gt; defined and doesn't do anything if it's not.<br>=
&gt; <br>&gt; So, it appears that copy-defconfig.inc should not directly tr=
y to call<br>&gt; that function because it makes the assumption that source=
ipk.bbclass is<br>&gt; always inherited. Simplest workaround would be to ch=
eck for<br>&gt; CREATE_SRCIPK variabe before calling that function, but I w=
onder if<br>&gt; there's a better solution...<br>&gt; <br>&gt; --<br><br>De=
nys, <br>Being new to this I can't really answer the question if there is a=
 better way. <br>I would like to know the proper way to check for CREATE_SR=
CIPK so that I can move on from this. <br>This seems to work but I do not h=
ave a high degree of confidence that I got it correct, seems like the value=
 should be checked too. <br><br>do_compile_prepend() {<br>&nbsp;&nbsp;&nbsp=
; if [ -n &quot;$CREATE_SRCIPK&quot; ]<br>&nbsp;&nbsp;&nbsp; then<br>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/.config ${S}/arch/arm/configs/=
${CONFIG_NAME}<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sourceipk_do_c=
reate_srcipk<br>&nbsp;&nbsp;&nbsp; fi<br>}<br><br>Matt S. <br><br>PS. <br>I=
 did notice that there is one other recipe doing something similar<br>./met=
a-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.=
a9.14.bb<br><br>&gt; Denys<o:p></o:p></span></p></div></div></div></body></=
html>=

--_000_4B07ADD556F70043925DA2E9C5D4346D2FD8728062MSXBEBVT12pla_--
