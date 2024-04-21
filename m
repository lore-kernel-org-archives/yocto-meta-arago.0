Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EBEC4345F
	for <webhook@archiver.kernel.org>; Sun, 21 Apr 2024 18:19:46 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1322.1713723577159709102
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 21 Apr 2024 11:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=QZEDPrVr;
 spf=pass (domain: criticallink.com, ip: 209.85.167.51, mailfrom: jcormier@criticallink.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51ae315bb20so1539375e87.1
        for <meta-arago@lists.yoctoproject.org>; Sun, 21 Apr 2024 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1713723575; x=1714328375; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J/McqUnntLUlc5dQcFVEt6omJPcxIsFzT+D9IfCCjVM=;
        b=QZEDPrVr8b2/CAyb6RlkjAFkMrzYdj1CP5AMrKTu09XUkwhdxA/bpo+Pfn7hno+TXD
         emtuPiU2onqQw4J+RxGbFNhkyGvl6IApri3LImrpwnd9/H8XNDg3oYEf9uNtNgtE5rbI
         fzWG4QqHdOAWffdqQfq4yKNwUKovgfz5jUKtHSxheO9U/JGGDfcLQDAgsRwkzNABaL6U
         QHR9XeHSHDDU9JMAIS02ngARyYn9jOJgKD58ku2BvjM59V/nSo4qbQeJP4h765LVhf4D
         h1MUmgQYVxztSgpyTu/NF4SoU/LJ67ciVsqTTMBdP9C36d3yzmVtaVMknV8LSwpXFf7V
         6j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713723575; x=1714328375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/McqUnntLUlc5dQcFVEt6omJPcxIsFzT+D9IfCCjVM=;
        b=IsRjj02p4GSFM6y6DUgQYNquiKNFR+T0Pr/DN1rnmpo7UH41/VI4cxhGBeQdhD9BR7
         FT+2GCniEiM4lEZT+HhkjPu8gmgje16jTO/GsXC930T4ZX7fDNUaechjYyAPW8IOv3+Q
         AYRYA09gSdaRdaLiLk3qvojCujNtgXWoHAVpuRI58fNyNtJhw9AwO3y5OyaKvdUf58ud
         ivYnJVepzPv3Um5aj0qYHyqKUYGSkq+fCPrnYaXvBirlY2bAhIXiX0sBpiSCbUSOlfGf
         rfI3vqanaL7uwKz9/Zh6MB/J2Ud/as+mbpfSpNV1s7DFYQVF1TgH4d9H2JK/Nqu8GPbi
         1UNw==
X-Forwarded-Encrypted: i=1; AJvYcCWy1fIPrTrWQ9Dd6mEYJh/qUqy+O5sdEb4IbfOxrsecxUwqfeng2RvinrzpYfsbjbjDedn8+YdEIw0gx+/oUrJ4ceeHOnPcE5n2TlGKH6dwNKU=
X-Gm-Message-State: AOJu0YxnNzc4h5j26tMjkVWlTct86XXWvCQQlTZXgsuJPazopos6ggLP
	qWkujpwsk78tX8ofeAGzgNJCqpXwgjKo0ZRKgazhVl1LNofjQDOAJQ9hrWNSZdmSlvV3z1k3Hl1
	/lbpzq3mInZq1KE1kNiglBBVFZ9KUJs/hrlLx
X-Google-Smtp-Source: AGHT+IGK5v51j6De6ZaV/aEjwj+/3t2Ll8HxYUe+6hgS382b6jwMxw5aZl8tkxIN/kLKiyTq/orGIj27CKNrRBKmRbE=
X-Received: by 2002:ac2:5a44:0:b0:518:b7dd:36a3 with SMTP id
 r4-20020ac25a44000000b00518b7dd36a3mr4833480lfn.54.1713723574857; Sun, 21 Apr
 2024 11:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240420125318.397900-1-c-shilwant@ti.com> <20240421030736.GZ28791@denix.org>
 <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
In-Reply-To: <1e3b95f7-e43f-44c9-92c5-15fdbc5ce8ab@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Sun, 21 Apr 2024 08:19:22 -1000
Message-ID: <CADL8D3ZNSnpAk8gKxVyh+KZeN0PTTW9HrG9R=HkErY5fxXv9ww@mail.gmail.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-distro:
 recipes-core: Add no-fstab-update option to WIC_CREATE_EXTRA_ARG
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>, meta-arago@lists.yoctoproject.org, 
	Gyan Gupta <g-gupta@ti.com>, dannenberg@ti.com
Content-Type: multipart/alternative; boundary="000000000000ec4b2906169f5c2e"
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 21 Apr 2024 18:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15301

--000000000000ec4b2906169f5c2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fyi, This is not a k3 only issue. We fix this for pretty much all ti
products.  We've fixed this for years on our own layer by defining our own
wic image which removes the /boot.

Setting --no-fstab-update wouldn't break our solution, though i do wonder
if it's too heavy handed.

https://support.criticallink.com/gitweb/?p=3Dmeta-mitysom.git;a=3Dblob;f=3D=
wic/sdimage-bootpart-nomountboot.wks;h=3D1e2c3927de62cd33382733fd4fdd24047a=
7d8fd9;hb=3Drefs/heads/kirkstone

https://support.criticallink.com/gitweb/?p=3Dmeta-mitysom.git;a=3Dblob;f=3D=
conf/machine/mitysom.inc;h=3D85256ad4c9039af390411e9811f6f49e570269d4;hb=3D=
refs/heads/kirkstone#l3

Ps. Not sure if anyone from meta-edgeai is on here but why would you rename
the boot partition to BOOT and change the rootfs name... Anyways I digress.


On Sat, Apr 20, 2024, 11:12=E2=80=AFPM Chirag Shilwant via lists.yoctoproje=
ct.org
<c-shilwant=3Dti.com@lists.yoctoproject.org> wrote:

> + Andreas
> On 21/04/24 08:37, Denys Dmytriyenko wrote:
> > On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:
> >> - Ideally running `ls /boot/` in filesystem should list contents from
> /rootfs/boot partition
> >> but currently it lists the contents of /boot partition of the WIC Imag=
e.
> >>
> >> Eg - Incase of AM64x,
> >> ```
> >>      root@am64xx-evm:~# ls /boot/
> >>      EFI  Image  tiboot3-am64x-gp-evm.bin
> tiboot3-am64x_sr2-hs-evm.bin  tiboot3-am64x_sr2-hs-fs-evm.bin  tiboot3.bi=
n
> tispl.bin  u-boot.img  uEnv.txt
> > Will this change affect EFI? As there's EFI directory in that partition=
.
>
> The EFI partition under /rootfs/boot will still be present.
> Following is the output of `ls /boot` with this patch,
>
> ```
> root@am64xx-evm:~# ls /boot
> EFI  Image  Image-6.1.80-ti-g2e423244f8c0 dtb  fitImage
> fitImage-6.1.80-ti-g2e423244f8c0
>
> ```
>
>
> >
> >
> >> ```
> >>
> >> - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTRA_AR=
G
> in arago-image.inc
> >> to prevent WIC image from adding an additional entry in /etc/fstab.
> > This flag is global and will prevent all other partitions from populati=
ng
> > /etc/fstab properly. Sure, meta-ti only has /boot and / defined, but
> other
> > layers could have own wic files with e.g. /home or /data partitions.
> Mounting
> > those will require a custom /etc/fstab instead of wic creating
> corresponding
> > entries automatically.
> >
>
>
> Apparently, this change was being carried in processor sdk layer from
> quite a long time (from dunfell) to resolve a customer issue reported by
> Andreas.
> Diving into our internal JIRA system showed that this fix was suggested
> by Andreas
> & was resolved by the SDK team back then by keeping this change in
> processor sdk layer [1].
> Not sure why this was in processor sdk layer though. Maybe Andreas can
> provide additional details.
>
> Btw, I also see other SOC vendors (meta-freescale) adding
> --no-fstab-update flag to WIC_CREATE_EXTRA_ARG [2]
> So, if we are planning to pull in this change should it go somewhere in
> meta-ti (maybe k3.inc [3])?
>
> [1]:
>
> https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/commit/recipes-c=
ore/images/tisdk-default-image.bbappend?h=3Ddunfell&id=3D58975a30e8f90efbff=
b97e49d5baac02971644da
> [2]:
>
> https://git.yoctoproject.org/meta-freescale/tree/conf/machine/include/imx=
-base.inc?h=3Dscarthgap#n614
> [3]:
>
> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/conf/machi=
ne/include/k3.inc?h=3Dscarthgap
>
>
> >> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >> ---
> >>   meta-arago-distro/recipes-core/images/arago-image.inc | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc
> b/meta-arago-distro/recipes-core/images/arago-image.inc
> >> index 00308b57..2a34a709 100644
> >> --- a/meta-arago-distro/recipes-core/images/arago-image.inc
> >> +++ b/meta-arago-distro/recipes-core/images/arago-image.inc
> >> @@ -31,4 +31,6 @@ BAD_RECOMMENDATIONS +=3D " \
> >>   "
> >>   BAD_RECOMMENDATIONS +=3D "${@oe.utils.conditional("INIT_MANAGER",
> "sysvinit", "", "busybox-syslog", d)}"
> >>
> >> +WIC_CREATE_EXTRA_ARGS +=3D " --no-fstab-update"
> >> +
> >>   inherit core-image remove-net-rules
> >> --
> >> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15300):
> https://lists.yoctoproject.org/g/meta-arago/message/15300
> Mute This Topic: https://lists.yoctoproject.org/mt/105635090/7902621
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [
> jcormier@criticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--000000000000ec4b2906169f5c2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Fyi, This is not a k3 only issue. We fix this for pr=
etty much all ti products.=C2=A0 We&#39;ve fixed this for years on our own =
layer by defining our own wic image which removes the /boot.=C2=A0</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Setting --no-fstab-update wouldn=
&#39;t break our solution, though i do wonder if it&#39;s too heavy handed.=
=C2=A0<br><div dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://=
support.criticallink.com/gitweb/?p=3Dmeta-mitysom.git;a=3Dblob;f=3Dwic/sdim=
age-bootpart-nomountboot.wks;h=3D1e2c3927de62cd33382733fd4fdd24047a7d8fd9;h=
b=3Drefs/heads/kirkstone">https://support.criticallink.com/gitweb/?p=3Dmeta=
-mitysom.git;a=3Dblob;f=3Dwic/sdimage-bootpart-nomountboot.wks;h=3D1e2c3927=
de62cd33382733fd4fdd24047a7d8fd9;hb=3Drefs/heads/kirkstone</a></div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://support.criticall=
ink.com/gitweb/?p=3Dmeta-mitysom.git;a=3Dblob;f=3Dconf/machine/mitysom.inc;=
h=3D85256ad4c9039af390411e9811f6f49e570269d4;hb=3Drefs/heads/kirkstone#l3">=
https://support.criticallink.com/gitweb/?p=3Dmeta-mitysom.git;a=3Dblob;f=3D=
conf/machine/mitysom.inc;h=3D85256ad4c9039af390411e9811f6f49e570269d4;hb=3D=
refs/heads/kirkstone#l3</a></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Ps. Not sure if anyone from meta-edgeai is on here but why would you re=
name the boot partition to BOOT and change the rootfs name... Anyways I dig=
ress.</div><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sat, Apr 20, 2024, 11:12=E2=80=AFPM Chirag Shilwan=
t via <a href=3D"http://lists.yoctoproject.org">lists.yoctoproject.org</a> =
&lt;c-shilwant=3D<a href=3D"mailto:ti.com@lists.yoctoproject.org">ti.com@li=
sts.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>+ Andreas<br>
On 21/04/24 08:37, Denys Dmytriyenko wrote:<br>
&gt; On Sat, Apr 20, 2024 at 06:23:18PM +0530, Chirag Shilwant wrote:<br>
&gt;&gt; - Ideally running `ls /boot/` in filesystem should list contents f=
rom /rootfs/boot partition<br>
&gt;&gt; but currently it lists the contents of /boot partition of the WIC =
Image.<br>
&gt;&gt;<br>
&gt;&gt; Eg - Incase of AM64x,<br>
&gt;&gt; ```<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 root@am64xx-evm:~# ls /boot/<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 EFI=C2=A0 Image=C2=A0 tiboot3-am64x-gp-evm.bin=
=C2=A0 tiboot3-am64x_sr2-hs-evm.bin=C2=A0 tiboot3-am64x_sr2-hs-fs-evm.bin=
=C2=A0 tiboot3.bin=C2=A0 tispl.bin=C2=A0 u-boot.img=C2=A0 uEnv.txt<br>
&gt; Will this change affect EFI? As there&#39;s EFI directory in that part=
ition.<br>
<br>
The EFI partition under /rootfs/boot will still be present.<br>
Following is the output of `ls /boot` with this patch,<br>
<br>
```<br>
root@am64xx-evm:~# ls /boot<br>
EFI=C2=A0 Image=C2=A0 Image-6.1.80-ti-g2e423244f8c0 dtb=C2=A0 fitImage=C2=
=A0 <br>
fitImage-6.1.80-ti-g2e423244f8c0<br>
<br>
```<br>
<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt; ```<br>
&gt;&gt;<br>
&gt;&gt; - To fix this issue, add --no-fstab-update flag to WIC_CREATE_EXTR=
A_ARG in arago-image.inc<br>
&gt;&gt; to prevent WIC image from adding an additional entry in /etc/fstab=
.<br>
&gt; This flag is global and will prevent all other partitions from populat=
ing<br>
&gt; /etc/fstab properly. Sure, meta-ti only has /boot and / defined, but o=
ther<br>
&gt; layers could have own wic files with e.g. /home or /data partitions. M=
ounting<br>
&gt; those will require a custom /etc/fstab instead of wic creating corresp=
onding<br>
&gt; entries automatically.<br>
&gt;<br>
<br>
<br>
Apparently, this change was being carried in processor sdk layer from<br>
quite a long time (from dunfell) to resolve a customer issue reported by <b=
r>
Andreas.<br>
Diving into our internal JIRA system showed that this fix was suggested <br=
>
by Andreas<br>
&amp; was resolved by the SDK team back then by keeping this change in <br>
processor sdk layer [1].<br>
Not sure why this was in processor sdk layer though. Maybe Andreas can <br>
provide additional details.<br>
<br>
Btw, I also see other SOC vendors (meta-freescale) adding <br>
--no-fstab-update flag to WIC_CREATE_EXTRA_ARG [2]<br>
So, if we are planning to pull in this change should it go somewhere in <br=
>
meta-ti (maybe k3.inc [3])?<br>
<br>
[1]: <br>
<a href=3D"https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/commit/=
recipes-core/images/tisdk-default-image.bbappend?h=3Ddunfell&amp;id=3D58975=
a30e8f90efbffb97e49d5baac02971644da" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/commit=
/recipes-core/images/tisdk-default-image.bbappend?h=3Ddunfell&amp;id=3D5897=
5a30e8f90efbffb97e49d5baac02971644da</a><br>
[2]: <br>
<a href=3D"https://git.yoctoproject.org/meta-freescale/tree/conf/machine/in=
clude/imx-base.inc?h=3Dscarthgap#n614" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://git.yoctoproject.org/meta-freescale/tree/conf/machine/i=
nclude/imx-base.inc?h=3Dscarthgap#n614</a><br>
[3]: <br>
<a href=3D"https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/c=
onf/machine/include/k3.inc?h=3Dscarthgap" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-b=
sp/conf/machine/include/k3.inc?h=3Dscarthgap</a><br>
<br>
<br>
&gt;&gt; Signed-off-by: Chirag Shilwant &lt;<a href=3D"mailto:c-shilwant@ti=
.com" target=3D"_blank" rel=3D"noreferrer">c-shilwant@ti.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-arago-distro/recipes-core/images/arago-image.inc =
| 2 ++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc=
 b/meta-arago-distro/recipes-core/images/arago-image.inc<br>
&gt;&gt; index 00308b57..2a34a709 100644<br>
&gt;&gt; --- a/meta-arago-distro/recipes-core/images/arago-image.inc<br>
&gt;&gt; +++ b/meta-arago-distro/recipes-core/images/arago-image.inc<br>
&gt;&gt; @@ -31,4 +31,6 @@ BAD_RECOMMENDATIONS +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 =C2=A0BAD_RECOMMENDATIONS +=3D &quot;${@oe.utils.conditional=
(&quot;INIT_MANAGER&quot;, &quot;sysvinit&quot;, &quot;&quot;, &quot;busybo=
x-syslog&quot;, d)}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt; +WIC_CREATE_EXTRA_ARGS +=3D &quot; --no-fstab-update&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0inherit core-image remove-net-rules<br>
&gt;&gt; -- <br>
&gt;&gt; 2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#15300): <a href=3D"https://lists.yoctoproject.org/g/met=
a-arago/message/15300" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lists.yoctoproject.org/g/meta-arago/message/15300</a><br>
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
</blockquote></div></div></div>

--000000000000ec4b2906169f5c2e--

