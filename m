Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id 7DF97529B5
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 04:17:41 +0000 (UTC)
Received: by obbkm3 with SMTP id km3so62474147obb.1
	for <meta-arago@arago-project.org>;
	Thu, 02 Jul 2015 21:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=AUnQPjvUChlFvhbFoHerVgnCJVEZxfAO5Mtxc6fw0MA=;
	b=mBvKgMEWHN9vX/zwiTGFHvywn8ZEERwSPRxn5pPi4mXZ6c+q43ztHu/SCAKC7RPcSx
	AzicwAJcQ1zRL9uhvtuukHUg6erJWSKhlys2IfZ3KrzWIjODvUSlDwgSS1An5KIXKqdA
	eCYeg7E3dLROGCNRM2X7BRH+uWxuqsqrprr1y+NvD10qWLO3hw4Et4yidxSCVJSVUfb9
	qAnL1H8l8UTPmY1ClMLsZnksK42Dn04gkdXLu6nnMsGWkuCN3WEy3ZmsgXLfTyJhoFLS
	FUxj/lpqbiIFcCT8H9ApILBdFLUsJE4fXm2ofXg5Oa24QIehjn1NJobv0MgzegP1D6/n
	OGWQ==
X-Received: by 10.182.246.9 with SMTP id xs9mr30632373obc.45.1435897060874;
	Thu, 02 Jul 2015 21:17:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.106.213 with HTTP; Thu, 2 Jul 2015 21:17:21 -0700 (PDT)
In-Reply-To: <CADySD0Et4JtD7_bZ8yMUkbaBrbrtrt8v8YETaJUHkSm=FbMaTg@mail.gmail.com>
References: <CADySD0Et4JtD7_bZ8yMUkbaBrbrtrt8v8YETaJUHkSm=FbMaTg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 3 Jul 2015 16:17:21 +1200
Message-ID: <CADySD0GJA3Mw4UMuEp9d5rmiChEL+ypZzgCuu-pFxXBLingw1Q@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Re: How to build browser (chrome/firefox) for AM335x using meta-arago
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
X-List-Received-Date: Fri, 03 Jul 2015 04:17:41 -0000
Content-Type: multipart/alternative; boundary=001a11c306ee3f616a0519f0d62c

--001a11c306ee3f616a0519f0d62c
Content-Type: text/plain; charset=UTF-8

Hi,

In case previous one was missed.

I want to build chrome/firefox browser for my AM335x EVM.

I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.

I see there is meta-browser which includes chrome, firefox.

How can I get them build with my tisdk rootfs ?

What all do I need to modify in my bblayer and local conf files ?

thanks


"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Fri, Jun 19, 2015 at 7:04 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
wrote:

> Hi,
>
> I want to build chrome/firefox browser for my AM335x EVM.
>
> I am using "arago-daisy-config.txt" to bitbake tisdk-rootfs-image.
>
> I see there is meta-browser which includes chrome, firefox.
>
> How can I get them build with my tisdk rootfs ?
>
> What all do I need to modify in my bblayer and local conf files ?
>
> thanks
>

--001a11c306ee3f616a0519f0d62c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:rgb(51,51,153)">Hi,</div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,1=
53)"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:rgb(51,51,153)">In case previous one was missed.<=
/div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-s=
ize:small;color:rgb(51,51,153)"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><div c=
lass=3D"gmail_default">I want to build chrome/firefox browser for my AM335x=
 EVM.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defau=
lt">I am using &quot;arago-daisy-config.txt&quot; to bitbake tisdk-rootfs-i=
mage.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_defau=
lt">I see there is meta-browser which includes chrome, firefox.</div><div c=
lass=3D"gmail_default"><br></div><div class=3D"gmail_default">How can I get=
 them build with my tisdk rootfs ?</div><div class=3D"gmail_default"><br></=
div><div class=3D"gmail_default">What all do I need to modify in my bblayer=
 and local conf files ?</div><div class=3D"gmail_default"><br></div><div cl=
ass=3D"gmail_default">thanks</div></div><div class=3D"gmail_default" style=
=3D"font-family:georgia,serif;font-size:small;color:rgb(51,51,153)"><br></d=
iv></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gm=
ail_signature"><div dir=3D"ltr">&quot;Knowledge is knowing tomato is a frui=
t, wisdom is not putting it in a fruit salad&quot;</div></div></div>
<br><div class=3D"gmail_quote">On Fri, Jun 19, 2015 at 7:04 PM, Ankur Tyagi=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D=
"_blank">ankur.tyagi85@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-f=
amily:georgia,serif;font-size:small;color:#333399">Hi,</div><div class=3D"g=
mail_default" style=3D"font-family:georgia,serif;font-size:small;color:#333=
399"><br></div><div class=3D"gmail_default" style=3D"font-family:georgia,se=
rif;font-size:small;color:#333399">I want to build chrome/firefox browser f=
or my AM335x EVM.</div><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:#333399"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:georgia,serif;font-size:small;color:#333399">I =
am using &quot;arago-daisy-config.txt&quot; to bitbake tisdk-rootfs-image.<=
/div><div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-s=
ize:small;color:#333399"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:georgia,serif;font-size:small;color:#333399">I see there is meta-=
browser which includes chrome, firefox.</div><div class=3D"gmail_default" s=
tyle=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div>=
<div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:s=
mall;color:#333399">How can I get them build with my tisdk rootfs ?</div><d=
iv class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sma=
ll;color:#333399"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:georgia,serif;font-size:small;color:#333399">What all do I need to modif=
y in my bblayer and local conf files ?</div><div class=3D"gmail_default" st=
yle=3D"font-family:georgia,serif;font-size:small;color:#333399"><br></div><=
div class=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:sm=
all;color:#333399">thanks</div>
</div>
</blockquote></div><br></div>

--001a11c306ee3f616a0519f0d62c--
