Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4217652007
	for <meta-arago@arago-project.org>;
	Fri, 19 Sep 2014 19:20:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8JJKidQ019376;
	Fri, 19 Sep 2014 14:20:44 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8JJKhsK030951;
	Fri, 19 Sep 2014 14:20:44 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 19 Sep 2014 14:20:43 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Matt.Schuckmann@planar.com" <Matt.Schuckmann@planar.com>
Thread-Topic: [meta-arago] Arago build fails if building srcipk is disabled
Thread-Index: Ac/Tg9hV8S3+HpktQnWrE2QbV99qEwAL/l+AAAJzV4AAIEvWfg==
Date: Fri, 19 Sep 2014 19:20:43 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE73210792F@DLEE08.ent.ti.com>
References: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FA1@MSXBEBVT12.planar.net>
	<20140918214549.GY2480@denix.org>,
	<4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
In-Reply-To: <4B07ADD556F70043925DA2E9C5D4346D2FD8727FD3@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
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
X-List-Received-Date: Fri, 19 Sep 2014 19:20:45 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE73210792FDLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE73210792FDLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks like you forgot curly brackets in the variable... Try copying the cod=
e I linked before as is - that should work, but I didn't try it myself yet,=
 due to traveling...


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Matt Schuckmann [Matt.Schuckmann@planar.com]
Received: Thursday, 18 Sep 2014, 15:56
To: Dmytriyenko, Denys [denys@ti.com]
CC: meta-arago@arago-project.org [meta-arago@arago-project.org]
Subject: RE: [meta-arago] Arago build fails if building srcipk is disabled



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]
> Sent: Thursday, September 18, 2014 2:46 PM
> To: Matt Schuckmann
> Cc: meta-arago@arago-project.org
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

--_000_B0581B5571079145BA1CD78C126DBDE73210792FDLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">Looks like you forgot curly brackets in the variable... Tr=
y copying the code I linked before as is - that should work, but I didn't t=
ry it myself yet, due to traveling...<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Matt Schuckmann [Matt.Schuckmann@planar.com]<br>
<b>Received:</b> Thursday, 18 Sep 2014, 15:56<br>
<b>To:</b> Dmytriyenko, Denys [denys@ti.com]<br>
<b>CC:</b> meta-arago@arago-project.org [meta-arago@arago-project.org]<br>
<b>Subject:</b> RE: [meta-arago] Arago build fails if building srcipk is di=
sabled<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Denys Dmytriyenko [<a href=3D"mailto:denys@ti.com">mailto:denys@=
ti.com</a>]<br>
&gt; Sent: Thursday, September 18, 2014 2:46 PM<br>
&gt; To: Matt Schuckmann<br>
&gt; Cc: meta-arago@arago-project.org<br>
&gt; Subject: Re: [meta-arago] Arago build fails if building srcipk is<br>
&gt; disabled<br>
&gt; <br>
&gt; On Thu, Sep 18, 2014 at 02:02:24PM -0700, Matt Schuckmann wrote:<br>
&gt; &gt; I've been chasing this for a bit and I think I've almost got it<b=
r>
&gt; figured out.<br>
&gt; &gt; I've been trying to create a new DISTRO based on Arago and I keep=
<br>
&gt; getting the following error.<br>
&gt; &gt;<br>
&gt; &gt; /home/dev/builds/zanzibar/tisdk/build/arago-tmp-external-linaro-<=
br>
&gt; toolch<br>
&gt; &gt; ain/work/zanziboard-oe-linux-gnueabi/linux-ti-staging/3.14.17-<br=
>
&gt; r22e&#43;git<br>
&gt; &gt; rAUTOINC&#43;1ef37cd35d-arago1/temp/run.do_compile.28819: line 10=
5:<br>
&gt; &gt; sourceipk_do_create_srcipk: command not found<br>
&gt; &gt;<br>
&gt; &gt; I finally figured out that if I included arago-source-ipk.conf in=
 my<br>
&gt; DISTRO file the error goes away.<br>
&gt; &gt; My understanding is that arago-source-ipk.conf turns on creating<=
br>
&gt; srcipk packages for all the packages included in the SDK. I'm not<br>
&gt; interested in creating srcipk's (at least I don't think I am) since I'=
m<br>
&gt; not trying to create an SDK I just want a deployable image.<br>
&gt; &gt;<br>
&gt; &gt; Digging a little deeper I found that meta-arago-distro/recipes-<b=
r>
&gt; kernel/linux/copy-defconfig.inc calls sourceipk_do_create_srcipk in a<=
br>
&gt; do_compile_prepend() function to pick up any changes to the<br>
&gt; configuration file and then rebuild the srcipk.<br>
&gt; &gt;<br>
&gt; &gt; I think that the do_compile_prepend() function should test the va=
lue<br>
&gt; of one of the CREATE_SRCIPK_* variables before it tries to call<br>
&gt; sourceipk_do_create_srcipk, I'm just not sure which one.<br>
&gt; &gt; I'm guessing maybe CREATE_SRCIPK_pn-linux-ti-staging but I'm not =
sure<br>
&gt; or maybe it should test multiple variables?<br>
&gt; &gt;<br>
&gt; &gt; I'd appreciate any guidance.<br>
&gt; <br>
&gt; Matt,<br>
&gt; <br>
&gt; So, the arago-source-ipk.conf defines which components need to create<=
br>
&gt; srcipk packages, but it also inherits the sourceipk.bbclass which<br>
&gt; provides the necessary sourceipk_do_create_srcipk() function. The firs=
t<br>
&gt; thing that function does is it checks whether CREATE_SRCIPK variable i=
s<br>
&gt; defined and doesn't do anything if it's not.<br>
&gt; <br>
&gt; So, it appears that copy-defconfig.inc should not directly try to call=
<br>
&gt; that function because it makes the assumption that sourceipk.bbclass i=
s<br>
&gt; always inherited. Simplest workaround would be to check for<br>
&gt; CREATE_SRCIPK variabe before calling that function, but I wonder if<br=
>
&gt; there's a better solution...<br>
&gt; <br>
&gt; --<br>
<br>
Denys, <br>
Being new to this I can't really answer the question if there is a better w=
ay. <br>
I would like to know the proper way to check for CREATE_SRCIPK so that I ca=
n move on from this.
<br>
This seems to work but I do not have a high degree of confidence that I got=
 it correct, seems like the value should be checked too.
<br>
<br>
do_compile_prepend() {<br>
&nbsp;&nbsp;&nbsp; if [ -n &quot;$CREATE_SRCIPK&quot; ]<br>
&nbsp;&nbsp;&nbsp; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/.config ${S}/arch/arm/co=
nfigs/${CONFIG_NAME}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sourceipk_do_create_srcipk<br>
&nbsp;&nbsp;&nbsp; fi<br>
}<br>
<br>
Matt S. <br>
<br>
PS. <br>
I did notice that there is one other recipe doing something similar<br>
./meta-arago-extras/recipes-bsp/ti-compat-wireless/ti-compat-wireless-wl18x=
x_r8.a9.14.bb<br>
<br>
&gt; Denys<br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE73210792FDLEE08entticom_--
