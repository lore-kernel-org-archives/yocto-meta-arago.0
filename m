Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3056C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 00:06:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.7329.1713830760576283099
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Apr 2024 17:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Ae1OMSSy;
 spf=pass (domain: criticallink.com, ip: 209.85.208.177, mailfrom: jcormier@criticallink.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2de15b771f9so430671fa.1
        for <meta-arago@lists.yoctoproject.org>; Mon, 22 Apr 2024 17:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1713830758; x=1714435558; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sLxx4rzhbI6XSpbMY90boaD6rZ/UJTr9/Dx7YJ8gXkY=;
        b=Ae1OMSSyaC3VWJWPHKhJKaTOhXkr2e5o9RUtSytFMYTaqbWYLY1ojppoXKTjov4cRE
         vD6bww/ApS8xMW454rFp56cJDUH5olmzReiQopBO2AkMWmHE4ejCLmRxvob4xt3kYpTd
         llnnGkiNUq8gssiPqVWOkGqEWmyhkpg+HFAa26DIuCf7zbEgizmXHdKQCYNDB+OTlITU
         lU5Ln1I2EGqu2PLyN/1dNqf7jNw7V/j1+S00tAAE17ol5P/C/mauPprb7CGM3yxiif/7
         J/MjYtHiSB5cgzoe6WYZhi4e7HTBvksbqg0Su4lGvepCVYswwFSUK1CjLwvtAFkEYhdj
         NONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713830758; x=1714435558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLxx4rzhbI6XSpbMY90boaD6rZ/UJTr9/Dx7YJ8gXkY=;
        b=RsN43YlcU7g3eQ2/ivpNs8TnJ787TKGtXgm8jc1+Cv3pz9YBfWoP008Dg/wc2tv3aX
         XxoZD30hAjIdiShwIcWi6BdQq878kXtOCIXB+AtEThK0+jsIrzg5quaOCgijxSpcFIc8
         W4In44CqjSeFqzCqsVquVPEZkzvae0MaSJInP3kaVFPdqJ4litUgq6YCSyEBMLD+EYNR
         TvFUm3Dh53Xd8rY0yD5Z+IuirwzDLTUXX7Bg1yfY7VDFXdDeyo1dV0i3eKGYJ7lGj80W
         Bw5c/HJgS8OjGpLzZ/iL2v9QqKAbeEXTEw4K5r+9JNhZpK5y13v5e9VPPga9VLYbIO44
         h83Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxJOGZS3EJ0YEywd4kb8LKWt3eRNgcz0Y2ey6irC8KgfHg4pVRCXwKYPrmSpq3fWZAGPZhHxQnJoGcarGpC9vmFjMAEfpZIdnHdYwG7PYbGWw=
X-Gm-Message-State: AOJu0YwRuj6jmVBktQK8+GmE7KX414AY+iiK0Zv5Qaf6LYZ2D/dhY7tj
	vpxQOa4QCGu2ZcVCt34JDOkra0wbEY1X2GKUWUDhiWDMwo26g52U7wBZI4kSg3dJJdmqXT4siqw
	2XxfRkAZClRQeBP6+NdjQOgNx54WRmevzZc6C
X-Google-Smtp-Source: AGHT+IG1aQ+/UMbYO1NnMWJ0mulXyIo4/veb5ZLxWJ7uJDQs/opfVJAcZiuSLFW73R+qGGGW0UOefp8djhjLVygj/+E=
X-Received: by 2002:a2e:9b41:0:b0:2da:bbb5:2839 with SMTP id
 o1-20020a2e9b41000000b002dabbb52839mr6536606ljj.11.1713830758517; Mon, 22 Apr
 2024 17:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240420125318.397900-1-c-shilwant@ti.com> <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com> <20240422223206.GB28791@denix.org>
In-Reply-To: <20240422223206.GB28791@denix.org>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 22 Apr 2024 14:05:46 -1000
Message-ID: <CADL8D3ZFq3M_iVN9=q7ecv2gaNPVLw-Mo6kxBaUbrAdJx39dvw@mail.gmail.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
To: Denys Dmytriyenko <denis@denix.org>
Cc: Chirag Shilwant <c-shilwant@ti.com>, Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org, 
	Gyan Gupta <g-gupta@ti.com>, dannenberg@ti.com
Content-Type: multipart/alternative; boundary="000000000000912d7b0616b851e6"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Apr 2024 00:06:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15303

--000000000000912d7b0616b851e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Though i'm curious what the /boot -> boot part does. When we did it we
deleted the /boot entirely.

Also while we are touching the file. Could add the M to "128" in the non
efi file so it matches and is more clear.

On Mon, Apr 22, 2024, 12:32=E2=80=AFPM Denys Dmytriyenko via lists.yoctopro=
ject.org
<denis=3Ddenix.org@lists.yoctoproject.org> wrote:

> On Sun, Apr 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:
> > + Andreas
> > On 21/04/24 08:37, Denys Dmytriyenko wrote:
> > >On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> > >>- Ideally running `ls /boot/` in filesystem should list contents from
> /rootfs/boot partition
> > >>but currently it lists the contents of /boot partition of the WIC
> Image.
> > >>
> > >>Eg - Incase of AM64x,
> > >>```
> > >>     root@am64xx-evm:~# ls /boot/
> > >>     EFI  Image  tiboot3-am64x-gp-evm.bin
> tiboot3-am64x_sr2-hs-evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bi=
n
> tispl.bin  u-boot.img  uEnv.txt
> > >Will this change affect EFI? As there's EFI directory in that partitio=
n.
> >
> > The EFI partition under /rootfs/boot will still be present.
> > Following is the output of `ls /boot` with this patch,
> >
> > ```
> > root@am64xx-evm:~# ls /boot
> > EFI  Image  Image-6.1.80-ti-g2e423244f8c0 dtb  fitImage
> > fitImage-6.1.80-ti-g2e423244f8c0
> >
> > ```
>
> Thanks, I'll do some additional testing with EFI a bit later.
>
>
> > >>- To fix this issue, add --no-fstab-update flag to
> WIC_CREATE_EXTRA_ARG in arago-image.inc
> > >>to prevent WIC image from adding an additional entry in /etc/fstab.
> > >This flag is global and will prevent all other partitions from
> populating
> > >/etc/fstab properly. Sure, meta-ti only has /boot and / defined, but
> other
> > >layers could have own wic files with e.g. /home or /data partitions.
> Mounting
> > >those will require a custom /etc/fstab instead of wic creating
> corresponding
> > >entries automatically.
> > >
> >
> >
> > Apparently, this change was being carried in processor sdk layer from
> > quite a long time (from dunfell) to resolve a customer issue
> > reported by Andreas.
> > Diving into our internal JIRA system showed that this fix was
> > suggested by Andreas
> > & was resolved by the SDK team back then by keeping this change in
> > processor sdk layer [1].
> > Not sure why this was in processor sdk layer though. Maybe Andreas
> > can provide additional details.
>
> I tested and submitted a different fix last night to adjust WIC templates
> to
> not mount boot partition under /boot directory[1]. I still believe doing
> it
> just for that one partition is better than disabling fstab updates
> globally.
>
> [1]
> https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.222130=
3-1-denis@denix.org/
>
> Can you please take a look and maybe test this option for your use case?
> Thanks.
>
> --
> Denys
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15302):
> https://lists.yoctoproject.org/g/meta-arago/message/15302
> Mute This Topic: https://lists.yoctoproject.org/mt/105635090/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--000000000000912d7b0616b851e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks good to me.=C2=A0<div dir=3D"auto"><br></div><div d=
ir=3D"auto">Though i&#39;m curious what the /boot -&gt; boot part does. Whe=
n we did it we deleted the /boot entirely.=C2=A0</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Also while we are touching the file. Could add the=
 M to &quot;128&quot; in the non efi file so it matches and is more clear.<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Apr 22, 2024, 12:32=E2=80=AFPM Denys Dmytriyenko via <a href=
=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;denis=3D<=
a href=3D"mailto:denix.org@lists.yoctoproject.org">denix.org@lists.yoctopro=
ject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, Apr=
 21, 2024 at 02:42:23PM +0530, Chirag Shilwant wrote:<br>
&gt; + Andreas<br>
&gt; On 21/04/24 08:37, Denys Dmytriyenko wrote:<br>
&gt; &gt;On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:<b=
r>
&gt; &gt;&gt;- Ideally running `ls /boot/` in filesystem should list conten=
ts from /rootfs/boot partition<br>
&gt; &gt;&gt;but currently it lists the contents of /boot partition of the =
WIC Image.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Eg - Incase of AM64x,<br>
&gt; &gt;&gt;```<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0root@am64xx-evm:~# ls /boot/<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0EFI=C2=A0 Image=C2=A0 tiboot3-am64x-gp-evm=
.bin=C2=A0 tiboot3-am64x_sr2-hs-evm.bin=C2=A0 tiboot3-am64x_sr2-hs-fs-evm.b=
in=C2=A0 tiboot3.bin=C2=A0 tispl.bin=C2=A0 u-boot.img=C2=A0 uEnv.txt<br>
&gt; &gt;Will this change affect EFI? As there&#39;s EFI directory in that =
partition.<br>
&gt; <br>
&gt; The EFI partition under /rootfs/boot will still be present.<br>
&gt; Following is the output of `ls /boot` with this patch,<br>
&gt; <br>
&gt; ```<br>
&gt; root@am64xx-evm:~# ls /boot<br>
&gt; EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitImage=
=C2=A0<br>
&gt; fitImage-6.1.80-ti-g2e423244f8c0<br>
&gt; <br>
&gt; ```<br>
<br>
Thanks, I&#39;ll do some additional testing with EFI a bit later.<br>
<br>
<br>
&gt; &gt;&gt;- To fix this issue, add --no-fstab-update flag to WIC_CREATE_=
EXTRA_ARG in arago-image.inc<br>
&gt; &gt;&gt;to prevent WIC image from adding an additional entry in /etc/f=
stab.<br>
&gt; &gt;This flag is global and will prevent all other partitions from pop=
ulating<br>
&gt; &gt;/etc/fstab properly. Sure, meta-ti only has /boot and / defined, b=
ut other<br>
&gt; &gt;layers could have own wic files with e.g. /home or /data partition=
s. Mounting<br>
&gt; &gt;those will require a custom /etc/fstab instead of wic creating cor=
responding<br>
&gt; &gt;entries automatically.<br>
&gt; &gt;<br>
&gt; <br>
&gt; <br>
&gt; Apparently, this change was being carried in processor sdk layer from<=
br>
&gt; quite a long time (from dunfell) to resolve a customer issue<br>
&gt; reported by Andreas.<br>
&gt; Diving into our internal JIRA system showed that this fix was<br>
&gt; suggested by Andreas<br>
&gt; &amp; was resolved by the SDK team back then by keeping this change in=
<br>
&gt; processor sdk layer [1].<br>
&gt; Not sure why this was in processor sdk layer though. Maybe Andreas<br>
&gt; can provide additional details.<br>
<br>
I tested and submitted a different fix last night to adjust WIC templates t=
o <br>
not mount boot partition under /boot directory[1]. I still believe doing it=
 <br>
just for that one partition is better than disabling fstab updates globally=
.<br>
<br>
[1] <a href=3D"https://patchwork.yoctoproject.org/project/ti/patch/20240421=
191458.2221303-1-denis@denix.org/" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://patchwork.yoctoproject.org/project/ti/patch/20240421191458.=
2221303-1-denis@denix.org/</a><br>
<br>
Can you please take a look and maybe test this option for your use case? <b=
r>
Thanks.<br>
<br>
-- <br>
Denys<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15302): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15302" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.yoctoproject.org/g/meta-arago/message/15302</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/105635090/790=
2621" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/105635090/7902621</a><br>
Group Owner: <a href=3D"mailto:meta-arago%2Bowner@lists.yoctoproject.org" t=
arget=3D"_blank" rel=3D"noreferrer">meta-arago+owner@lists.yoctoproject.org=
</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-arago/unsub" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.=
org/g/meta-arago/unsub</a> [<a href=3D"mailto:jcormier@criticallink.com" ta=
rget=3D"_blank" rel=3D"noreferrer">jcormier@criticallink.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
<br>
</blockquote></div>

--000000000000912d7b0616b851e6--

