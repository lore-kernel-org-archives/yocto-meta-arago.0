Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id A112E52A67
	for <meta-arago@arago-project.org>;
	Fri, 19 Sep 2014 20:08:30 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NC500GB1ZXHRZR0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 19 Sep 2014 15:08:06 -0500 (CDT)
Received: from [10.253.6.136] (70-35-38-154.static.wiline.com [70.35.38.154])
	by gandalf.denix.org (Postfix) with ESMTPA id 06AAE20086; Fri,
	19 Sep 2014 16:08:04 -0400 (EDT)
User-Agent: K-9 Mail for Android
In-reply-to: <4B07ADD556F70043925DA2E9C5D4346D2FD8728062@MSXBEBVT12.planar.net>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>,
	<4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
	<B0581B5571079145BA1CD78C126DBDE73210792F@DLEE08.ent.ti.com>
	<4B07ADD556F70043925DA2E9C5D4346D2FD8728062@MSXBEBVT12.planar.net>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 19 Sep 2014 13:07:53 -0700
To: Matt Schuckmann <Matt.Schuckmann@planar.com>,
	"Dmytriyenko, Denys" <denys@ti.com>
Message-id: <f41aac96-c5ad-49e1-921a-a3c12e2d201e@email.android.com>
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
X-List-Received-Date: Fri, 19 Sep 2014 20:08:30 -0000
Content-type: multipart/alternative;
	boundary=----2MYFYP5MR5WXAIS7N2RXTS0L2OE9TI
Content-transfer-encoding: 8bit

------2MYFYP5MR5WXAIS7N2RXTS0L2OE9TI
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On September 19, 2014 1:04:46 PM PDT, Matt Schuckmann <Matt.Schuckmann@planar.com> wrote:
>Assuming that this is bash script, which I'm pretty sure it is, the {}
>are not required here. In bash {} are used to separate an identifier
>from surrounding text (i.e. ${CREATE_SRCIPK}_foo_bar, without the {}
>bash would look for the variable $CREATE_SRCIPK_foo_bar
>
>I get the same error regardless if the {} are there are not.
>
>The correct way appears to be
>if [ -n "${CREATE_SRCIPK}" ] && [ "${CREATE_SRCIPK}" != "0" ]
>
>I've got a patch that does this for the 2 files that call
>sourceipk_do_create_srcipk directly, I'm not sure if I should send the
>patch it to this list or ? I'm kind of new to this.
>
>Thanks,
>Matt S.
>
>PS. I was wondering if it would be better to use the IRC channel for
>this kind of stuff?
>
>From: Dmytriyenko, Denys [mailto:denys@ti.com]
>Sent: Friday, September 19, 2014 12:21 PM
>To: Matt Schuckmann
>Cc: meta-arago@arago-project.org
>Subject: RE: [meta-arago] Arago build fails if building srcipk is
>disabled
>
>Looks like you forgot curly brackets in the variable... Try copying the
>code I linked before as is - that should work, but I didn't try it
>myself yet, due to traveling...
>
>
>Sent from my Android phone using TouchDown
>(www.nitrodesk.com<http://www.nitrodesk.com>)
>
>-----Original Message-----
>From: Matt Schuckmann [Matt.Schuckmann@planar.com]
>Received: Thursday, 18 Sep 2014, 15:56
>To: Dmytriyenko, Denys [denys@ti.com]
>CC: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
>[meta-arago@arago-project.org]
>Subject: RE: [meta-arago] Arago build fails if building srcipk is
>disabled
>
>
>> -----Original Message-----
>> From: Denys Dmytriyenko [mailto:denys@ti.com]
>> Sent: Thursday, September 18, 2014 2:46 PM
>> To: Matt Schuckmann
>> Cc: meta-arago@arago-project.org<mailto:meta-arago@arago-project.org>
>> Subject: Re: [meta-arago] Arago build fails if building srcipk is
>> disabled
>>
>> On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:
>> > I've been chasing this for a bit and I think I've almost got it
>> figured out.
>> > I've been trying to create a new DISTRO based on Arago and I keep
>> getting the following error.
>> >
>> > /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-
>> toolch
>> > ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-
>> r22e+git
>> > rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:
>> > sourceipk_do_create_srcipk: command not found
>> >
>> > I finally figured out that if I included arago-source-ipk.conf in
>my
>> DISTRO file the error goes away.
>> > My understanding is that arago-source-ipk.conf turns on creating
>> srcipk packages for all the packages included in the SDK. I'm not
>> interested in creating srcipk's (at least I don't think I am) since
>I'm
>> not trying to create an SDK I just want a deployable image.
>> >
>> > Digging a little deeper I found that meta-arago-distro/recipes-
>> kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a
>> do_compile_prepend() function to pick up any changes to the
>> configuration file and then rebuild the srcipk.
>> >
>> > I think that the do_compile_prepend() function should test the
>value
>> of one of the CREATE_SRCIPK_* variables before it tries to call
>> sourceipk_do_create_srcipk, I'm just not sure which one.
>> > I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not
>sure
>> or maybe it should test multiple variables?
>> >
>> > I'd appreciate any guidance.
>>
>> Matt,
>>
>> So, the arago-source-ipk.conf defines which components need to create
>> srcipk packages, but it also inherits the sourceipk.bbclass which
>> provides the necessary sourceipk_do_create_srcipk() function. The
>first
>> thing that function does is it checks whether CREATE_SRCIPK variable
>is
>> defined and doesn't do anything if it's not.
>>
>> So, it appears that copy-defconfig.inc should not directly try to
>call
>> that function because it makes the assumption that sourceipk.bbclass
>is
>> always inherited. Simplest workaround would be to check for
>> CREATE_SRCIPK variabe before calling that function, but I wonder if
>> there's a better solution...
>>
>> --
>
>Denys,
>Being new to this I can't really answer the question if there is a
>better way.
>I would like to know the proper way to check for CREATE_SRCIPK so that
>I can move on from this.
>This seems to work but I do not have a high degree of confidence that I
>got it correct, seems like the value should be checked too.
>
>do_compile_prepend() {
>    if [ -n "$CREATE_SRCIPK" ]
>    then
>        cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
>        sourceipk_do_create_srcipk
>    fi
>}
>
>Matt S.
>
>PS.
>I did notice that there is one other recipe doing something similar
>./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb
>
>> Denys
>
>
>------------------------------------------------------------------------
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

Curly brackets there are for bitbake, not bash... Checking whether the variable is defined first does make sense though.

-- 
Denys

------2MYFYP5MR5WXAIS7N2RXTS0L2OE9TI
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html v="urn:schemas-microsoft-com:vml" o="urn:schemas-microsoft-com:office:office" w="urn:schemas-microsoft-com:office:word" m="http://schemas.microsoft.com/office/2004/12/omml"><head><meta http-equiv="Content-Type" content="text/html; charset=us-ascii" /><meta name="Generator" content="Microsoft Word 12 (filtered medium)" /><style><!--
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
--></style></head><body lang="EN-US" link="blue" vlink="purple"><div class="gmail_quote">On September 19, 2014 1:04:46 PM PDT, Matt Schuckmann &lt;Matt.Schuckmann@planar.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]--><div class="WordSection1"><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">Assuming that this is bash script, which I&#8217;m pretty sure it is, the {} are not required here. In bash {} are used to separate an identifier from surrounding text (i.e. ${CREATE_SRCIPK}_foo_bar, without the {} bash would look for the variable $CREATE_SRCIPK_foo_bar<p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">I get the same error regardless if the {} are there are not. <p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">The correc
 t way
appears to be<p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">if [ -n &quot;${CREATE_SRCIPK}&quot; ] &amp;&amp; [ &quot;${CREATE_SRCIPK}&quot; != &quot;0&quot; ]<p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">I&#8217;ve got a patch that does this for the 2 files that call sourceipk_do_create_srcipk directly, I&#8217;m not sure if I should send the patch it to this list or ? I&#8217;m kind of new to this. <p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">Thanks,<p></p></span></p><p class="MsoNormal"><span
style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">Matt S. <p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D">PS. I was wondering if it would be better to use the IRC channel for this kind of stuff? <p></p></span></p><p class="MsoNormal"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D"><p>&nbsp;</p></span></p><div style="border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in 4.0pt"><div><div style="border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in 0in 0in"><p class="MsoNormal"><b><span style="font-size:10.0pt;font-family:"Tahoma","sans-serif"">From:</span></b><span style="font-size:10.0pt;font-family:"Tahoma","sans-serif""> Dmytriyenko, Denys [mailto:denys@ti.com] <br /><b>Sent:</b> Friday, September 19, 2014 12:21 P
 M<br
/><b>To:</b> Matt Schuckmann<br /><b>Cc:</b> meta-arago@arago-project.org<br /><b>Subject:</b> RE: [meta-arago] Arago build fails if building srcipk is disabled<p></p></span></p></div></div><p class="MsoNormal"></p><p>&nbsp;</p><div><p class="MsoNormal" style="margin-bottom:12.0pt"><span style="font-size:11.0pt;font-family:"Calibri","sans-serif";color:black">Looks like you forgot curly brackets in the variable... Try copying the code I linked before as is - that should work, but I didn't try it myself yet, due to traveling...<br /><br /><br />Sent from my Android phone using TouchDown (<a href="http://www.nitrodesk.com">www.nitrodesk.com</a>)<br /><br />-----Original Message----- <br /><b>From:</b> Matt Schuckmann [Matt.Schuckmann@planar.com]<br /><b>Received:</b> Thursday, 18 Sep 2014, 15:56<br /><b>To:</b> Dmytriyenko, Denys [denys@ti.com]<br /><b>CC:</b> <a href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a> [meta-arago@arago-project.org]<br
/><b>Subject:</b> RE: [meta-arago] Arago build fails if building srcipk is disabled<p></p></span></p></div><div><p class="MsoNormal"><span style="font-size:10.0pt"><br /><br />&gt; -----Original Message-----<br />&gt; From: Denys Dmytriyenko [<a href="mailto:denys@ti.com">mailto:denys@ti.com</a>]<br />&gt; Sent: Thursday, September 18, 2014 2:46 PM<br />&gt; To: Matt Schuckmann<br />&gt; Cc: <a href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br />&gt; Subject: Re: [meta-arago] Arago build fails if building srcipk is<br />&gt; disabled<br />&gt; <br />&gt; On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:<br />&gt; &gt; I've been chasing this for a bit and I think I've almost got it<br />&gt; figured out.<br />&gt; &gt; I've been trying to create a new DISTRO based on Arago and I keep<br />&gt; getting the following error.<br />&gt; &gt;<br />&gt; &gt; /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-<br />&gt; toolch<b
 r
/>&gt; &gt; ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-<br />&gt; r22e+git<br />&gt; &gt; rAUTOINC+1ef37cd35d-arago1/temp/run.do_compile.28819: line 105:<br />&gt; &gt; sourceipk_do_create_srcipk: command not found<br />&gt; &gt;<br />&gt; &gt; I finally figured out that if I included arago-source-ipk.conf in my<br />&gt; DISTRO file the error goes away.<br />&gt; &gt; My understanding is that arago-source-ipk.conf turns on creating<br />&gt; srcipk packages for all the packages included in the SDK. I'm not<br />&gt; interested in creating srcipk's (at least I don't think I am) since I'm<br />&gt; not trying to create an SDK I just want a deployable image.<br />&gt; &gt;<br />&gt; &gt; Digging a little deeper I found that meta-arago-distro/recipes-<br />&gt; kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a<br />&gt; do_compile_prepend() function to pick up any changes to the<br />&gt; configuration file and then rebuild the srcipk.<br /
 >&gt;
&gt;<br />&gt; &gt; I think that the do_compile_prepend() function should test the value<br />&gt; of one of the CREATE_SRCIPK_* variables before it tries to call<br />&gt; sourceipk_do_create_srcipk, I'm just not sure which one.<br />&gt; &gt; I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not sure<br />&gt; or maybe it should test multiple variables?<br />&gt; &gt;<br />&gt; &gt; I'd appreciate any guidance.<br />&gt; <br />&gt; Matt,<br />&gt; <br />&gt; So, the arago-source-ipk.conf defines which components need to create<br />&gt; srcipk packages, but it also inherits the sourceipk.bbclass which<br />&gt; provides the necessary sourceipk_do_create_srcipk() function. The first<br />&gt; thing that function does is it checks whether CREATE_SRCIPK variable is<br />&gt; defined and doesn't do anything if it's not.<br />&gt; <br />&gt; So, it appears that copy-defconfig.inc should not directly try to call<br />&gt; that function because it makes the assumption t
 hat
sourceipk.bbclass is<br />&gt; always inherited. Simplest workaround would be to check for<br />&gt; CREATE_SRCIPK variabe before calling that function, but I wonder if<br />&gt; there's a better solution...<br />&gt; <br />&gt; --<br /><br />Denys, <br />Being new to this I can't really answer the question if there is a better way. <br />I would like to know the proper way to check for CREATE_SRCIPK so that I can move on from this. <br />This seems to work but I do not have a high degree of confidence that I got it correct, seems like the value should be checked too. <br /><br />do_compile_prepend() {<br />&nbsp;&nbsp;&nbsp; if [ -n &quot;$CREATE_SRCIPK&quot; ]<br />&nbsp;&nbsp;&nbsp; then<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sourceipk_do_create_srcipk<br />&nbsp;&nbsp;&nbsp; fi<br />}<br /><br />Matt S. <br /><br />PS. <br />I did notice that there is one other re
 cipe
doing something similar<br />./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18xx_r8.a9.14.bb<br /><br />&gt; Denys<p></p></span></p></div></div></div><p style="margin-top: 2.5em; margin-bottom: 1em; border-bottom: 1px solid #000"></p><pre class="k9mail"><hr /><br />meta-arago mailing list<br />meta-arago@arago-project.org<br /><a href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br /></pre></blockquote></div><br clear="all">Curly brackets there are for bitbake, not bash... Checking whether the variable is defined first does make sense though.<br>
<br>
-- <br>
Denys</body></html>

------2MYFYP5MR5WXAIS7N2RXTS0L2OE9TI--
