Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 3EB6C52092
	for <meta-arago@arago-project.org>;
	Fri,  9 Feb 2018 16:42:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w19GgdbE019521
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 10:42:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518194559;
	bh=RllEWbtaZTlHN+qWAEyCbHPScYbEZv0OTM3I654mG1E=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=yLSCrte30jewLd8LnVaQKhev9Z++Ry1Kxc58gpJMa2uRdzsn06byWi2VG0cEJhCSJ
	sWoX1UH/UIlhWQWtiM/pczcW9m7TsIdbG5AfPdcv9a+IuUrxlAjKFFpeumIE+UE5px
	zuXNoXWf5aSyxhIJh4n7tHIZbHuolhOwhxD6lL8s=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19GgdaH029048
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 10:42:39 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 9 Feb 2018 10:42:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 9 Feb 2018 10:42:39 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19GgcYk010795;
	Fri, 9 Feb 2018 10:42:39 -0600
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1518190522-46326-1-git-send-email-m-radhakrishnan2@ti.com>
	<46835993-0fef-d46d-7700-7cb6fa3eb3e0@ti.com>
	<3fca7c959e4d419787af68e4b29c695b@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3ba364e1-dbb1-d4c1-c530-700b37198452@ti.com>
Date: Fri, 9 Feb 2018 11:42:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <3fca7c959e4d419787af68e4b29c695b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Updating version & checksum
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
X-List-Received-Date: Fri, 09 Feb 2018 16:42:50 -0000
Content-Type: multipart/alternative;
	boundary="------------F9B7C9683CC5DAE8B705FEC6"
Content-Language: en-US

--------------F9B7C9683CC5DAE8B705FEC6
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2/9/2018 11:38 AM, Radhakrishnan, Mahesh wrote:
>
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Friday, February 9, 2018 11:04 AM
> To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
> Subject: Re: [EXTERNAL] [meta-arago] 
> [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Updating version & 
> checksum
>
> On 2/9/2018 10:35 AM, Mahesh Radhakrishnan wrote:
>
> > ---
>
> > recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++
>
> >   1 file changed, 7 insertions(+)
>
> >
>
> > diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend 
> b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
>
> > index f46d2b6..d4da4ce 100644
>
> > --- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
>
> > +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
>
> > @@ -4,4 +4,11 @@ DEPENDS_append_ti43x = " pruss-lld-rtos \
>
> >   "
>
> >   DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
>
> >   "
>
> > +LIC_FILES_CHKSUM = 
> "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c 
> <file:///%5C%5CI2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c>"
>
> Why did the license checksum change?
>
> The copyright year changed in the copyright header in i2c.h ( 
> Copyright (C) 2014-2018). Hence the checksum change.
>

OK. Thank you.

> > +
>
> > +I2C_LLD_SRCREV = "137c6c60d18a14629f1a7572fd87402716bd5104"
>
> > +
>
> > +PV = "01.00.00.10"
>
> > +
>
> >   INSANE_SKIP_${PN} = "arch"
>
> > +
>


--------------F9B7C9683CC5DAE8B705FEC6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 2/9/2018 11:38 AM, Radhakrishnan,
      Mahesh wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3fca7c959e4d419787af68e4b29c695b@ti.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="Generator" content="Microsoft Word 14 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoPlainText"><o:p> </o:p></p>
        <p class="MsoPlainText"><a name="_MailEndCompose"
            moz-do-not-send="true"><o:p> </o:p></a></p>
        <p class="MsoPlainText">-----Original Message-----<br>
          From: Stiffler, Jacob <br>
          Sent: Friday, February 9, 2018 11:04 AM<br>
          To: Radhakrishnan, Mahesh; <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
          Subject: Re: [EXTERNAL] [meta-arago]
          [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Updating
          version &amp; checksum</p>
        <p class="MsoPlainText"><o:p> </o:p></p>
        <p class="MsoPlainText"><o:p> </o:p></p>
        <p class="MsoPlainText"><o:p> </o:p></p>
        <p class="MsoPlainText">On 2/9/2018 10:35 AM, Mahesh
          Radhakrishnan wrote:<o:p></o:p></p>
        <p class="MsoPlainText">&gt; ---<o:p></o:p></p>
        <p class="MsoPlainText">&gt;  
          recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++<o:p></o:p></p>
        <p class="MsoPlainText">&gt;   1 file changed, 7 insertions(+)<o:p></o:p></p>
        <p class="MsoPlainText">&gt;<o:p> </o:p></p>
        <p class="MsoPlainText">&gt; diff --git
          a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
          b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend<o:p></o:p></p>
        <p class="MsoPlainText">&gt; index f46d2b6..d4da4ce 100644<o:p></o:p></p>
        <p class="MsoPlainText">&gt; ---
          a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +++
          b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend<o:p></o:p></p>
        <p class="MsoPlainText">&gt; @@ -4,4 +4,11 @@
          DEPENDS_append_ti43x = " pruss-lld-rtos \<o:p></o:p></p>
        <p class="MsoPlainText">&gt;   "<o:p></o:p></p>
        <p class="MsoPlainText">&gt;   DEPENDS_append_am57xx-evm = "
          pruss-lld-rtos \<o:p></o:p></p>
        <p class="MsoPlainText">&gt;   "<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +LIC_FILES_CHKSUM = "<a
href="file:///%5C%5CI2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"
            moz-do-not-send="true"><span
              style="color:windowtext;text-decoration:none">file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c</span></a>"<o:p></o:p></p>
        <p class="MsoPlainText"><o:p> </o:p></p>
        <p class="MsoPlainText">Why did the license checksum change?<o:p></o:p></p>
        <p class="MsoPlainText">The copyright year changed in the
          copyright header in i2c.h ( Copyright (C) 2014-<span
            style="color:red">2018</span>). Hence the checksum change.<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:black"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    <br>
    OK. Thank you.<br>
    <br>
    <blockquote type="cite"
      cite="mid:3fca7c959e4d419787af68e4b29c695b@ti.com">
      <div class="WordSection1">
        <p class="MsoPlainText">&gt; +<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +I2C_LLD_SRCREV =
          "137c6c60d18a14629f1a7572fd87402716bd5104"<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +PV = "01.00.00.10"<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +<o:p></o:p></p>
        <p class="MsoPlainText">&gt;   INSANE_SKIP_${PN} = "arch"<o:p></o:p></p>
        <p class="MsoPlainText">&gt; +<o:p></o:p></p>
        <p class="MsoPlainText"><o:p> </o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------F9B7C9683CC5DAE8B705FEC6--
