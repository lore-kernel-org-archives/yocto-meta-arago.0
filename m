Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 64A9D52986
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 13:24:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GDNNgd003149
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521206603;
	bh=LeRptXF0fIf/7af/F35FHjhQWDWIRhFZEWeM4wmzo84=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ympM58eApRlY7ZaDQOstWGFtAUmXxEeapkF5oRXdvwYUHWf3E1ZPMmTJ2IXnCHahn
	+BvI5gbsNBk9MVeQ5JJIjASBhvMEHWj0gQJwKX2ToGw+D/xAAAn9qoqoywE8isVqfy
	PgWIJAzE4X4BMn0VO3mSJbPMUDZy/Ty+ERFhrJv0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GDNNQZ015304
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 08:23:23 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 08:23:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 08:23:23 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GDNN0l009332;
	Fri, 16 Mar 2018 08:23:23 -0500
To: "Ruei, Eric" <e-ruei1@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
References: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
	<6d774a67-674a-9615-5e81-d0500faef810@ti.com>
	<f8e51ccdc7a048d59712f5deca3abd9d@ti.com>
	<b330dc3cb06e428fb49ac43192ba0529@ti.com>
	<6a27ae35e51a4ee181c51f1848ad5984@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <75a77cc0-b775-e957-26ae-4014de853f64@ti.com>
Date: Fri, 16 Mar 2018 09:23:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <6a27ae35e51a4ee181c51f1848ad5984@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH v3] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Fri, 16 Mar 2018 13:24:19 -0000
Content-Type: multipart/alternative;
	boundary="------------016E6B8A8B654E38F7FE0B9C"
Content-Language: en-US

--------------016E6B8A8B654E38F7FE0B9C
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Sorry for the false alarm. I have pushed this. Thank you.


On 3/16/2018 9:04 AM, Ruei, Eric wrote:
> Yes, the latest one was in.
>
> Best regards,
>
> Eric
>
>
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Friday, March 16, 2018 9:00 AM
> To: Ruei, Eric; meta-arago@arago-project.org
> Subject: RE: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH 
> v3] video-graphics-test: bump SRCREV to pick up the latest version
>
> I needed to update meta-ti for this. I am trying again now.
>
> > -----Original Message-----
> > From: Ruei, Eric
> > Sent: Friday, March 16, 2018 8:59 AM
> > To: Stiffler, Jacob; meta-arago@arago-project.org
> > Subject: RE: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH
> > v3] video-graphics-test: bump SRCREV to pick up the latest version
> >
> > Hi, Jake:
> >
> > We have submitted a gc320 patch to meta-arago long back. I thought
> > that it was in, let me check again.
> >
> > Best regards,
> >
> > Eric
> >
> >
> >
> >
> > -----Original Message-----
> > From: Stiffler, Jacob
> > Sent: Friday, March 16, 2018 8:45 AM
> > To: Ruei, Eric; meta-arago@arago-project.org
> > Subject: Re: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH
> > v3] video-graphics-test: bump SRCREV to pick up the latest version
> >
> > I get an different error now.
> >
> >
> > | In file included from ../git/gc320.cpp:39:0:
> > | ../git/gc320.h:38:20: fatal error: gc_hal.h: No such file or
> > |directory
> > |  #include <gc_hal.h>
> > |                     ^
> > | compilation terminated.
> > | Makefile:942: recipe for target 'gc320.o' failed
> > | make: *** [gc320.o] Error 1
> > | make: *** Waiting for unfinished jobs....
> > | In file included from ../git/video_graphics_test.cpp:46:0:
> > | ../git/gc320.h:38:20: fatal error: gc_hal.h: No such file or
> > |directory
> > |  #include <gc_hal.h>
> > |                     ^
> > | compilation terminated.
> > | Makefile:937: recipe for target 'video_graphics_test.o' failed
> > | make: *** [video_graphics_test.o] Error 1
> >
> >
> >
> > On 3/15/2018 5:24 PM, Eric Ruei wrote:
> > > - include gc320
> > > - QPA interface changes
> > > - dual-screen support
> > > - add more dependencies
> > >
> > > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > > ---
> > > recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> > > | 6
> > +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/recipes-multimedia/video-graphics-test/video-graphics-
> > test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-
> > test_1.0.bb
> > > index c19af16..30805a5 100644
> > > ---
> > > a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
> > > +++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0
> > > +++ .bb
> > > @@ -4,12 +4,12 @@ SECTION = "multimedia"
> > >   LICENSE = "GPLv2"
> > >   LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
> > >
> > > -DEPENDS += "libdrm"
> > > +DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
> > >
> > > -PR = "r0"
> > > +PR = "r1"
> > >
> > >   BRANCH = "master"
> > > -SRCREV = "3b3007680845d39784146396a2dd2a68aa1a2283"
> > > +SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
> > >
> > >   SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-
> > test.git;protocol=git;branch=${BRANCH} \
> > >   "
>


--------------016E6B8A8B654E38F7FE0B9C
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Sorry for the false alarm. I have pushed this. Thank you.<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 3/16/2018 9:04 AM, Ruei, Eric wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6a27ae35e51a4ee181c51f1848ad5984@ti.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="Generator" content="Microsoft Exchange Server">
      <!-- converted from text -->
      <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
      <font size="2"><span style="font-size:10pt;">
          <div class="PlainText">Yes, the latest one was in.<br>
            <br>
            Best regards,<br>
            <br>
            Eric<br>
            <br>
            <br>
            -----Original Message-----<br>
            From: Stiffler, Jacob <br>
            Sent: Friday, March 16, 2018 9:00 AM<br>
            To: Ruei, Eric; <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
            Subject: RE: [EXTERNAL] [meta-arago]
            [morty][meta-processor-sdk][PATCH v3] video-graphics-test:
            bump SRCREV to pick up the latest version<br>
            <br>
            I needed to update meta-ti for this. I am trying again now.<br>
            <br>
            &gt; -----Original Message-----<br>
            &gt; From: Ruei, Eric<br>
            &gt; Sent: Friday, March 16, 2018 8:59 AM<br>
            &gt; To: Stiffler, Jacob; <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
            &gt; Subject: RE: [EXTERNAL] [meta-arago]
            [morty][meta-processor-sdk][PATCH <br>
            &gt; v3] video-graphics-test: bump SRCREV to pick up the
            latest version<br>
            &gt; <br>
            &gt; Hi, Jake:<br>
            &gt; <br>
            &gt; We have submitted a gc320 patch to meta-arago long
            back. I thought <br>
            &gt; that it was in, let me check again.<br>
            &gt; <br>
            &gt; Best regards,<br>
            &gt; <br>
            &gt; Eric<br>
            &gt; <br>
            &gt; <br>
            &gt; <br>
            &gt; <br>
            &gt; -----Original Message-----<br>
            &gt; From: Stiffler, Jacob<br>
            &gt; Sent: Friday, March 16, 2018 8:45 AM<br>
            &gt; To: Ruei, Eric; <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
            &gt; Subject: Re: [EXTERNAL] [meta-arago]
            [morty][meta-processor-sdk][PATCH <br>
            &gt; v3] video-graphics-test: bump SRCREV to pick up the
            latest version<br>
            &gt; <br>
            &gt; I get an different error now.<br>
            &gt; <br>
            &gt; <br>
            &gt; | In file included from ../git/gc320.cpp:39:0:<br>
            &gt; | ../git/gc320.h:38:20: fatal error: gc_hal.h: No such
            file or <br>
            &gt; |directory<br>
            &gt; |  #include &lt;gc_hal.h&gt;<br>
            &gt; |                     ^<br>
            &gt; | compilation terminated.<br>
            &gt; | Makefile:942: recipe for target 'gc320.o' failed<br>
            &gt; | make: *** [gc320.o] Error 1<br>
            &gt; | make: *** Waiting for unfinished jobs....<br>
            &gt; | In file included from
            ../git/video_graphics_test.cpp:46:0:<br>
            &gt; | ../git/gc320.h:38:20: fatal error: gc_hal.h: No such
            file or <br>
            &gt; |directory<br>
            &gt; |  #include &lt;gc_hal.h&gt;<br>
            &gt; |                     ^<br>
            &gt; | compilation terminated.<br>
            &gt; | Makefile:937: recipe for target
            'video_graphics_test.o' failed<br>
            &gt; | make: *** [video_graphics_test.o] Error 1<br>
            &gt; <br>
            &gt; <br>
            &gt; <br>
            &gt; On 3/15/2018 5:24 PM, Eric Ruei wrote:<br>
            &gt; &gt; - include gc320<br>
            &gt; &gt; - QPA interface changes<br>
            &gt; &gt; - dual-screen support<br>
            &gt; &gt; - add more dependencies<br>
            &gt; &gt;<br>
            &gt; &gt; Signed-off-by: Eric Ruei <a class="moz-txt-link-rfc2396E" href="mailto:e-ruei1@ti.com">&lt;e-ruei1@ti.com&gt;</a><br>
            &gt; &gt; ---<br>
            &gt; &gt;  
            recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
            <br>
            &gt; &gt; | 6<br>
            &gt; +++---<br>
            &gt; &gt;   1 file changed, 3 insertions(+), 3 deletions(-)<br>
            &gt; &gt;<br>
            &gt; &gt; diff --git
            a/recipes-multimedia/video-graphics-test/video-graphics-<br>
            &gt; test_1.0.bb
            b/recipes-multimedia/video-graphics-test/video-graphics-<br>
            &gt; test_1.0.bb<br>
            &gt; &gt; index c19af16..30805a5 100644<br>
            &gt; &gt; --- <br>
            &gt; &gt;
            a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb<br>
            &gt; &gt; +++
            b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0<br>
            &gt; &gt; +++ .bb<br>
            &gt; &gt; @@ -4,12 +4,12 @@ SECTION = "multimedia"<br>
            &gt; &gt;   LICENSE = "GPLv2"<br>
            &gt; &gt;   LIC_FILES_CHKSUM =<br>
            &gt; "<a
              href="file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
              moz-do-not-send="true">file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5</a>"<br>
            &gt; &gt;<br>
            &gt; &gt; -DEPENDS += "libdrm"<br>
            &gt; &gt; +DEPENDS += "libdrm ti-gc320-libs cmem
            qtdeclarative"<br>
            &gt; &gt;<br>
            &gt; &gt; -PR = "r0"<br>
            &gt; &gt; +PR = "r1"<br>
            &gt; &gt;<br>
            &gt; &gt;   BRANCH = "master"<br>
            &gt; &gt; -SRCREV =
            "3b3007680845d39784146396a2dd2a68aa1a2283"<br>
            &gt; &gt; +SRCREV =
            "bdfbc4179d8d176feec1df148728b1882fca7416"<br>
            &gt; &gt;<br>
            &gt; &gt;   SRC_URI =
            "git://git.ti.com/sitara-linux/video-graphics-<br>
            &gt; test.git;protocol=git;branch=${BRANCH} \<br>
            &gt; &gt;   "<br>
            <br>
          </div>
        </span></font>
    </blockquote>
    <br>
  </body>
</html>

--------------016E6B8A8B654E38F7FE0B9C--
