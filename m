Return-Path: <paul.kovitz@welchallyn.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by arago-project.org (Postfix) with ESMTPS id 06C3D52A6C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 17:46:55 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id uo5so341751pbc.39
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 09:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=5/01mftoo1y4RTyrA9ORjKQqYbQgeRzy9imBZ/MXEFY=;
	b=kyceqX/+51hswc51xLGc88DH8EtiGl185vlAMVbyPOW1FMigRM87cDGYaV7PTLv8HC
	3wS6D3/QKM78XE7oAwhU4weOdmGhJmjGobmO8JYBMDJty5znip5vYaTMd1JW2f5LHGtr
	snsRd/Yc2L+ySPQofAFGCcHBddz+OE82GCcYME+R9YtZuOJLhE6pjvHF/ngaUg3yJ0oF
	MB+wREryb/uK4Qd4440Y2A8Sy2xGuyZmMwPg5LLCUQzjlkVlSEh2t7XQtqD3Tp7dDGGx
	fNSC7hpEMtVWsA71amfc/BYiFCHhCoqbkTYC1GqnedIhcVI7UYKRmD2560yHbBUmx0NH
	wSIA==
X-Received: by 10.66.81.231 with SMTP id d7mr15280709pay.27.1359136014654;
	Fri, 25 Jan 2013 09:46:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.73.106 with HTTP; Fri, 25 Jan 2013 09:46:14 -0800 (PST)
In-Reply-To: <7D46E86EC0A8354091174257B2FED101593A25DB@DLEE12.ent.ti.com>
References: <CA+edY+Tw5JtFgevWy8hWNA7wH8ykuKV=W4Eq1yqo1Vq0jMtyLw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED101593A25DB@DLEE12.ent.ti.com>
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Fri, 25 Jan 2013 09:46:14 -0800
Message-ID: <CA+edY+Teh+82ZozQx4hYL-uGkp-kG=8E6h1EMGB=F=_aNi0xUw@mail.gmail.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
X-Gm-Message-State: ALoCoQnrNYrk8Aq/DikEQM5twzJWSeJ7xMmVm4nX6Y7SmQuHfoGeDX9uA+K5J015Z+e1vZC1ZSvV
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: newbie question: license.manifest vs. package.manifest vs. opkg list
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
X-List-Received-Date: Fri, 25 Jan 2013 17:46:56 -0000
Content-Type: multipart/alternative; boundary=f46d042ef5b95ade5c04d420836a

--f46d042ef5b95ade5c04d420836a
Content-Type: text/plain; charset=ISO-8859-1

Hi Chase. Thanks for the help. For the arago-base-image I generated, the
following files are in package.manifest but not in license.manifest:
libasound2

libcrypto1.0.0

libcurl5

liblzo2-2

libopkg1


libssl1.0.0

libtinfo5

libusb-0.1-4

libusb-1.0-0
libuuid1
libz1




On Fri, Jan 25, 2013 at 6:59 AM, Maupin, Chase <chase.maupin@ti.com> wrote:

>  Paul,****
>
> ** **
>
> Can you give some examples of a package listed in the package.manifest
> that is not in the license.manifest file?****
>
> ** **
>
> Sincerely,
> Chase Maupin
> Integration Team Manager
> Linux Core Product Development
> e-mail: chase.maupin@ti.com
> phone: (214) 567-2950
>
> For support:
> Forums - http://community.ti.com/forums/
> Wiki - http://wiki.davincidsp.com/ ****
>
> ** **
>
> *From:* meta-arago-bounces@arago-project.org [mailto:
> meta-arago-bounces@arago-project.org] *On Behalf Of *Paul Kovitz
> *Sent:* Thursday, January 24, 2013 7:15 PM
> *To:* meta-arago@arago-project.org
> *Subject:* [meta-arago] newbie question: license.manifest vs.
> package.manifest vs. opkg list****
>
> ** **
>
> I am using the 05.06.00.00 baseline. I have an image recipe that I created
> by removing some packages from tisdk-rootfs-image.bb, changing the
> ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to qt4-embedded and making
> edits to task-arago-tisdk-graphics.bb and task-arago-tisdk-matrix.bb to
> not use packages that rely on opengl-es to run. The image worked as
> expected on the target hardware for the tests I ran. ****
>
> ** **
>
> I wanted to understand the licenses this build used, so I looked
> in build/arago-tmp-external-arago-toolchain/deploy/licenses/[my new image
> name] and saw the license.manifest and package.manifest files. To verify
> package.manifest, I looked at the packages the target displayed as a result
> of opkg list and compared the output package.manifest. The opkg list
> command listed two packages that are not in package.manifest. The other 288
> package names match exactly. The same build has 69 more  package names in
> package.manifest than there are in license.manaifest. The other 219 package
> names match exactly.****
>
> ** **
>
> I thought I must have done something wrong, so I built base-arago-image
> from the 05.06.00.00 release and looked at the
> arago-tmp-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-20130124231158
> directory. There are 11 more package names in package.manifest than there
> are in license.manifest. The other 40 names match exactly.****
>
> ** **
>
> Am I doing something wrong, or is this expected behavior, or perhaps both?
> Thanks in advance for the help.****
>
> ** **
>
> --
> Paul Kovitz****
>
> ** **
>



-- 
Paul Kovitz
Lead Embedded Software Engineer
Welch Allyn
8500 SW Creekside Place
Beaverton, OR 97008
503-530-7304 (voice)

--f46d042ef5b95ade5c04d420836a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chase. Thanks for the help. For the arago-base-image I =
generated, the following files are in package.manifest but not in license.m=
anifest:<div><div>libasound2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
</div>

<div>libcrypto1.0.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>libcur=
l5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>liblzo2-2 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>libo=
pkg1 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>

<div>libssl1.0.0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div><div>libt=
info5 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0</div>

<div>libusb-0.1-4 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>libus=
b-1.0-0</div><div>libuuid1</div><div>libz1</div></div><div><br></div><div><=
br></div></div><div class=3D"gmail_extra">

<br><br><div class=3D"gmail_quote">On Fri, Jan 25, 2013 at 6:59 AM, Maupin,=
 Chase <span dir=3D"ltr">&lt;<a href=3D"mailto:chase.maupin@ti.com" target=
=3D"_blank">chase.maupin@ti.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">







<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Paul,<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Can you give some example=
s of a package listed in the package.manifest that is not in the license.ma=
nifest file?<u></u><u></u></span></p>


<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Sincerely,<br>
Chase Maupin<br>
Integration Team Manager<br>
Linux Core Product Development<br>
e-mail: <a href=3D"mailto:chase.maupin@ti.com" target=3D"_blank">chase.maup=
in@ti.com</a><br>
phone: <a href=3D"tel:%28214%29%20567-2950" value=3D"+12145672950" target=
=3D"_blank">(214) 567-2950</a><br>
<br>
For support:<br>
Forums - <a href=3D"http://community.ti.com/forums/" target=3D"_blank">http=
://community.ti.com/forums/</a><br>
Wiki - <a href=3D"http://wiki.davincidsp.com/" target=3D"_blank">http://wik=
i.davincidsp.com/</a></span><span style=3D"font-size:11.0pt;font-family:&qu=
ot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #b5c4df 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> <a href=
=3D"mailto:meta-arago-bounces@arago-project.org" target=3D"_blank">meta-ara=
go-bounces@arago-project.org</a> [mailto:<a href=3D"mailto:meta-arago-bounc=
es@arago-project.org" target=3D"_blank">meta-arago-bounces@arago-project.or=
g</a>]
<b>On Behalf Of </b>Paul Kovitz<br>
<b>Sent:</b> Thursday, January 24, 2013 7:15 PM<br>
<b>To:</b> <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank=
">meta-arago@arago-project.org</a><br>
<b>Subject:</b> [meta-arago] newbie question: license.manifest vs. package.=
manifest vs. opkg list<u></u><u></u></span></p>
</div>
</div><div><div class=3D"h5">
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">I am using the 05.06.00.00 baseline. I have an image=
 recipe that I created by removing some packages from
<a href=3D"http://tisdk-rootfs-image.bb" target=3D"_blank">tisdk-rootfs-ima=
ge.bb</a>, changing the ARAGO_QT_PROVIDER_armv7a from qt4-embedded-gles to =
qt4-embedded and making edits to
<a href=3D"http://task-arago-tisdk-graphics.bb" target=3D"_blank">task-arag=
o-tisdk-graphics.bb</a> and
<a href=3D"http://task-arago-tisdk-matrix.bb" target=3D"_blank">task-arago-=
tisdk-matrix.bb</a> to not use packages that rely on opengl-es to run. The =
image worked as expected on the target hardware for the tests I ran.=A0<u><=
/u><u></u></p>


</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I wanted to understand the licenses this build used,=
 so I looked in=A0build/arago-tmp-external-arago-toolchain/deploy/licenses/=
[my new image name] and saw the license.manifest and package.manifest files=
. To verify package.manifest, I looked
 at the packages the target displayed as a result of opkg list and compared=
 the output package.manifest. The opkg list command listed two packages tha=
t are not in package.manifest. The other 288 package names match exactly. T=
he same build has 69 more =A0package
 names in package.manifest than there are in license.manaifest. The other 2=
19 package names match exactly.<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I thought I must have done something wrong, so I bui=
lt base-arago-image from the 05.06.00.00 release and looked at the arago-tm=
p-external-arago-toolchain/deploy/licenses/arago-base-image-am335x-evm-2013=
0124231158 directory. There are 11
 more package names in package.manifest than there are in license.manifest.=
 The other 40 names match exactly.<u></u><u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Am I doing something wrong, or is this expected beha=
vior, or perhaps both? Thanks in advance for the help.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<p class=3D"MsoNormal">-- <br>
Paul Kovitz<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
</div>
</div>
</div></div></div>
</div>
</div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Paul Kovitz<=
div>Lead Embedded Software Engineer<br><div>Welch Allyn</div><div>8500 SW C=
reekside Place</div><div>Beaverton, OR 97008</div><div>503-530-7304 (voice)=
</div>

</div>
</div>

--f46d042ef5b95ade5c04d420836a--
