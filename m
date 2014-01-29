Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by arago-project.org (Postfix) with ESMTPS id AADA9529BC
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 15:20:28 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so1864744pbb.34
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 07:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=48LbgLArEFEZJS9xyDHQnYL5SdhxNO/NF1KyYE+XJlE=;
	b=Ji/JSWN5+nNayrECoU0IWNrqpTksK9cNT8BfEZYbYWhIyjMJODjY5RBoeZsj/VqJ3+
	TQe6LDuqxwN37a0jDjLFkL6QGQu7/xr9wf0WIohSl5drMyfkWEyUnGHmg6xV2yzq+dic
	lBoknWmvHv6pDlzWeiT5U74UTU0m/rBGrMTcPcNs64NL4SqIV8aI/Otjt1uMF0SDDJKW
	N8gSZGZw1wf5Ty6ORxtw4BkmtUre4TFLFF30GD0wduZBuCwSD7RrBTmvnkks3tf+Y1Jw
	NowbxTZza39QEoasOuQOSiuHXjGmmj7WH1TXYFfKPJuZG4/j6nfdn6Ni4eSRpVfRqsta
	xXsQ==
MIME-Version: 1.0
X-Received: by 10.68.230.137 with SMTP id sy9mr8546971pbc.126.1391008826461;
	Wed, 29 Jan 2014 07:20:26 -0800 (PST)
Received: by 10.68.208.227 with HTTP; Wed, 29 Jan 2014 07:20:26 -0800 (PST)
In-Reply-To: <20140129025313.GM6814@edge>
References: <CADnUhn0GG7AByt0bWeqkCtVWxNxr66-8m16-YaxnM-S4aw5B4w@mail.gmail.com>
	<20140129025313.GM6814@edge>
Date: Wed, 29 Jan 2014 17:20:26 +0200
Message-ID: <CADnUhn3EbUhYYo4TjxVi+dDM9n-62SOk65kCH-ehe_-Ax4DGZg@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org, Pekon Gupta <pekon@ti.com>
Subject: Re: ubifs crossupport between Linux and U-Boot
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
X-List-Received-Date: Wed, 29 Jan 2014 15:20:29 -0000
Content-Type: multipart/alternative; boundary=047d7b339ba9fb14fb04f11d7a30

--047d7b339ba9fb14fb04f11d7a30
Content-Type: text/plain; charset=ISO-8859-1

In short:
If I create UBIFS partition on Linux side, it works quite fine. I can
create directories, files update them without  problems. But if I open this
volume on U-Boot side, I'll get thousands of ecc error messages. Now, if I
try to access this same volume from Linux side after this episode, it also
provides these ecc errors. Therefore, Linux created UBIFS partition gets
corrupted by accessing it from U-Boot side. Volume opening is enough for
this. This I have experienced by Angstrom distribution with Linux 3.8.13
and it possibly was U-Boot 10.04. Anyhow, as it seems that you are now
working with Linux 3.12 - U-Boot 2013-10 combination, you'll need patching
to cope with this issue. By my understanding required patching is not made
before U-Boot 2014-01 and Linux 3.14.

Patching required include:
Quote from Pekon's answer to me:

"
I don't think any earlier kernel versions ever supported beaglebone
Its only recently that a major patch-series of NAND driver was
accepted and  tested on beaglebone.
The patches  are currently in l2-mtd.git tree which should make into
3.13 kernel, before being in linux-next for sometime.
(a) Reference:
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049462.html

(b) In addition to above series, you might need beaglebone DTS updates
which you can refer from below ..
http://lists.infradead.org/pipermail/linux-mtd/2013-October/049438.html
"

U-Boot patching over U-Boot 2013-10 should be found from:
http://patchwork.ozlabs.org/project/uboot/list/?submitter=17320&state=*.

I'm not sure how valid above link is anymore. Maybe Pekon can comment that.

-Matti

2014-01-29 Denys Dmytriyenko <denys@ti.com>

> On Mon, Jan 20, 2014 at 04:29:52PM +0200, matti kaasinen wrote:
> > Hi!
> >
> > I Have been using Angstrom distribution for my beaglebone (+ nand flash)
> > based board. Problem with Angstrom baked Linux/U-boot images is that
> > whereas both support ubifs partition on nand flash they both seem to
> handle
> > it in their own ways. Does Aragon distribution have this same problem?
>
> Can you please provide more detailed report for the issue? Otherwise it's
> quite difficult to give any recommendations. Thanks.
>
> --
> Denys
>

--047d7b339ba9fb14fb04f11d7a30
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>In short:<br></div>If I create UBIFS partit=
ion on Linux side, it works quite fine. I can create directories, files upd=
ate them without=A0 problems. But if I open this volume on U-Boot side, I&#=
39;ll get thousands of ecc error messages. Now, if I try to access this sam=
e volume from Linux side after this episode, it also provides these ecc err=
ors. Therefore, Linux created UBIFS partition gets corrupted by accessing i=
t from U-Boot side. Volume opening is enough for this. This I have experien=
ced by Angstrom distribution with Linux 3.8.13 and it possibly was U-Boot 1=
0.04. Anyhow, as it seems that you are now working with Linux 3.12 - U-Boot=
 2013-10 combination, you&#39;ll need patching to cope with this issue. By =
my understanding required patching is not made before U-Boot 2014-01 and Li=
nux 3.14.<br>
<br></div>Patching required include:<br></div>Quote from Pekon&#39;s answer=
 to me:<br><br>&quot;<br>I don&#39;t think any earlier kernel versions ever=
 supported beaglebone<br>
Its only recently that a major patch-series of NAND driver was<br>
accepted and =A0tested on beaglebone.<br>
The patches =A0are currently in l2-mtd.git tree which should make into<br>
3.13 kernel, before being in linux-next for sometime.<br>
(a) Reference:<br>
<a href=3D"http://lists.infradead.org/pipermail/linux-mtd/2013-October/0494=
62.html" target=3D"_blank">http://lists.infradead.org/pipermail/linux-mtd/2=
013-October/049462.html</a><br>
<br>
(b) In addition to above series, you might need beaglebone DTS updates<br>
which you can refer from below ..<br>
<a href=3D"http://lists.infradead.org/pipermail/linux-mtd/2013-October/0494=
38.html" target=3D"_blank">http://lists.infradead.org/pipermail/linux-mtd/2=
013-October/049438.html</a><br>
<div>&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">U-Boot patching over U-Boot 2013-10 should be found from: <a href=
=3D"http://patchwork.ozlabs.org/project/uboot/list/?submitter=3D17320&amp;s=
tate=3D*" target=3D"_blank">http://patchwork.ozlabs.org/project/uboot/list/=
?submitter=3D17320&amp;state=3D*</a>.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I&#39;m not=
 sure how valid above link is anymore. Maybe Pekon can comment that.<br><br=
></div><div class=3D"gmail_extra">-Matti<br></div><div class=3D"gmail_extra=
"><br>
<div class=3D"gmail_quote">2014-01-29 Denys Dmytriyenko <span dir=3D"ltr">&=
lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</=
span><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<div class=3D""><div class=3D"h5">On Mon, Jan 20, 2014 at 04:29:52PM +0200,=
 matti kaasinen wrote:<br>
&gt; Hi!<br>
&gt;<br>
&gt; I Have been using Angstrom distribution for my beaglebone (+ nand flas=
h)<br>
&gt; based board. Problem with Angstrom baked Linux/U-boot images is that<b=
r>
&gt; whereas both support ubifs partition on nand flash they both seem to h=
andle<br>
&gt; it in their own ways. Does Aragon distribution have this same problem?=
<br>
<br>
</div></div>Can you please provide more detailed report for the issue? Othe=
rwise it&#39;s<br>
quite difficult to give any recommendations. Thanks.<br>
<span class=3D""><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br></div></div>

--047d7b339ba9fb14fb04f11d7a30--
