Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 890A652B8D
	for <meta-arago@arago-project.org>;
	Wed, 21 Apr 2021 04:02:35 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) by
	mx-outbound8-225.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 21 Apr 2021 04:03:00 +0000
Received: by mail-wr1-f71.google.com with SMTP id
	v20-20020a5d59140000b02901028c7a1f7dso11997411wrd.18
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 21:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZspE8couHDFt3lXYopqyNXJkXnu5MC63dljSvQPJiVo=;
	b=DWfikRrbgOIURDQ+TkonOsC2Y66YBlt67dBNaJA0BywAbj0lyO7vFkz+o8b0qQdQCu
	2fc78vzz5jEu1gUoOczdBtlJReHHtLbEo74Zs47BhX5z3XqCvyc6RKhwjBgGpuFCF2ql
	ZQp8n07n6s74FFkqSWzZWU/2fxGGP/w+uazEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZspE8couHDFt3lXYopqyNXJkXnu5MC63dljSvQPJiVo=;
	b=mfKBDwQaBB4Iid32g6gD+gp7IS3ce3UzsTzf9LNem9VgXEJe1/Vz/WEplLnfyA0KDt
	0KPjADTUycR9XgqP0WsA+oW1FA9R3NFTBAIeLVBxzNLWezSWWw55hFUQ4LQReDrDMJhs
	WWSV1wLXB6Q8E0C3tsRWar8CPhLsZTxBogB0amwGDI4MHx3znigZHBaqL3TARsmUYy7J
	OCQAt407SG9Til9i+W2AEQjdaR4t/EDFNDkbZbJf3wTjQKtp6fEAJJh2AAzAI6EY8N5p
	GfeZay6vpXp64LlJbH+k2aZGUTzFQG2fXzDJar2k7XZM8B7VSICUYHDw/z6INcvpaPt4
	Yl3Q==
X-Gm-Message-State: AOAM533FYylzUWxtY4AyvHSsJsMkpabWO0A+sX9gVCzDnOpXhFlq9Ld+
	0IDm8ARJBVDiktb7gMaE7hw2XzowPiHXnFDzIPbea/G6B2pwj29pH1uk2qBkliM/LeGuCs6HneO
	pJ1liJX+C/S3oJFzdrajYTAhYEZmJ8Yh2xG/ZLw+x9EOXscqrH+9tUsYMBgSigL8Oa+lh/W+jNY
	aK
X-Received: by 2002:a5d:58f3:: with SMTP id f19mr24430414wrd.133.1618977780038;
	Tue, 20 Apr 2021 21:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGO6LX6euXBWl16Z8p232U6BTuvz5xl009CSI6adSriRjoeFuH+B8XoBBXONFY698BSDnD5NtliTwRDJ8v6yY=
X-Received: by 2002:a5d:58f3:: with SMTP id f19mr24430395wrd.133.1618977779852;
	Tue, 20 Apr 2021 21:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210420174155.50628-1-x0257345@ti.com>
	<20210420175803.GP15937@denix.org>
In-Reply-To: <20210420175803.GP15937@denix.org>
From: Sinthu Raja M <sinthu.raja@mistralsolutions.com>
Date: Wed, 21 Apr 2021 09:32:48 +0530
Message-ID: <CAEd-yTRK+pHjhuKAuTbimAXRGB3a3JvfRcZFfTVcsqF=SSE2PQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-BESS-ID: 1618977780-302273-26170-17292-1
X-BESS-VER: 2019.1_20210420.1810
X-BESS-Apparent-Source-IP: 209.85.221.71
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.231699 [from 
	cloudscan9-151.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH 1/1] AM64x Unification Add recipes to generate WIC file
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
X-List-Received-Date: Wed, 21 Apr 2021 04:02:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 11:28 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Tue, Apr 20, 2021 at 11:11:55PM +0530, Sinthu Raja wrote:
> >   Add two recipies to generate two WIC files for AM64x EVM and SK.
> >   Each recipe has its own path to the deployed boot images and
> >   corresponding WIC file name.
>
> Adding extra and very specialized images would only increase complexity. =
Just
> last year we went to extra efforts to simplify this area down to 3 generi=
c
> images...
>
As you mention the AM64x EVM yocto build generates 3 images such as
sitara-rootfs-image tisdk-base-image tisdk-tiny-image. This patch is
just a copy of tisdk-base-image yocto recipe, except for the image
name and the image deployed location. I didn't find any other options
to create WIC files for EVM and SK in one single machine name.
If this is not acceptable then we have to modify the image class files
corresponding to do_wic_image() function, which takes more effort.
>
> > ---
> >  .../images/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk=
-base-image-evm.bb&c=3DE,1,Yf_IdGj_QfwVOINXXIf3qMzdg8GJtfTq0RvWSWpdLcfDEhKJ=
qlmB5gkWdx2Va4CusgQpDb1PRf98265hVIFwWCQDy0Hj8sa5pgxNpmhCIqg,&typo=3D1      =
      | 19 +++++++++++++++++
> >  .../images/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk=
-base-image-sk.bb&c=3DE,1,7P8mWG53yES3FKUIQoAO6ArStaD-kNsrT27w1Xu0UfBF7FnHM=
5EwWgHH6EssC4DvMKQEPK2Blqvan3d4fpSOXCn-qUvN0SxQiEU9fuHzg65LHcrtUqIQ4FFbpgc,=
&typo=3D1             | 21 +++++++++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-core/images/https://linkp=
rotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-evm.bb&c=3DE,1,iL=
KvpXKnTBfkOTYnQf3pjV2pcbYKJBtni0FS3Trt9jLGxmk5aZhkkKbfWWqGvcDfAPrS9Bsrap4T5=
WVfo-PzNr664MOjiPKCyqK-vS39MRi30Bf0LMZfyfhw0sU,&typo=3D1
> >  create mode 100644 meta-arago-distro/recipes-core/images/https://linkp=
rotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-sk.bb&c=3DE,1,Gn_=
LCvdR45Pc0W5ZphDUFoFta76aBAtdbksgE8UEE2g8vwVme-kIO7QRA-9sDw9K1m54rzh6FoiGJ1=
h-guQods6a9PnPRAhsoaElmgBsiZYxuYGDaFvKo5E,&typo=3D1
> >
> > diff --git a/meta-arago-distro/recipes-core/images/https://linkprotect.=
cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-evm.bb&c=3DE,1,eSQziEcXu=
5VVDMtd7xgb5Caf2Y7AuBVHQbyxYFTIUnCR7_I8r9B8CMOGU-8w8j__1XnJt7xEnvNqbIFpmVnA=
_y6CzKt79m8qCaFlDwSNJEjerU3dnZV6uw,,&typo=3D1 b/meta-arago-distro/recipes-c=
ore/images/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-base=
-image-evm.bb&c=3DE,1,pZCxTi_YdHGIgefPQ7ySD_cPZZAcIMQWle1zJFE3ZuHMbSSOocM82=
yBefaEpYSiq-gMx-JOIkuH0ESeXHPOqJsi3bw8d8mwoNrXThlu6JmRz&typo=3D1
> > new file mode 100644
> > index 00000000..14813bad
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/https://linkprotect.cudasvc=
.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-evm.bb&c=3DE,1,tXKddYf1isiLnDsQ=
HPoIPzFcnI6g6XxtdZ4DUTfoueWetjoYtK0p5sZSQlrLXNzXVORAkdMCluZBEAZp8vDCY7OEC8t=
B_YLdJVJ6dPqRJJiqxPmdWVoc&typo=3D1
> > @@ -0,0 +1,19 @@
> > +# Arago TI SDK base image with test tools
> > +# Suitable for initramfs
> > +
> > +require recipes-core/images/https://linkprotect.cudasvc.com/url?a=3Dht=
tps%3a%2f%2farago-image.inc&c=3DE,1,iSqKvd_ji2TSPtfYxaMC5PO72oucFcqcfYm8fvd=
i2Iku7OacTWFcuXaZPAsglqUcPkz17Z1sd-MDC1TkElMnnPuTYFYYDZUCdhNX0xBWGBKj4l4lKe=
3i&typo=3D1
> > +
> > +IMAGE_FSTYPES +=3D "cpio.xz"
> > +IMAGE_FSTYPES_append_dra7xx =3D " ubifs ubi"
> > +
> > +IMAGE_INSTALL +=3D "\
> > +    packagegroup-arago-base \
> > +    packagegroup-arago-console \
> > +    packagegroup-arago-base-tisdk \
> > +    ${VIRTUAL-RUNTIME_initramfs} \
> > +    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', =
d)} \
> > +    "
> > +
> > +export IMAGE_BASENAME =3D "tisdk-base-image-evm"
> > +export IMAGE_LINK_NAME =3D "tisdk-base-image-am64xx-evm"
> > +export DEPLOY_DIR_IMAGE=3D"/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_s=
k/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/dep=
loy/images/am64xx-evm/evm"
> > diff --git a/meta-arago-distro/recipes-core/images/https://linkprotect.=
cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-sk.bb&c=3DE,1,v_qvyxjHFt=
8mB0SrPUpVM6yV7oS9bPx2uTunmzz0ux4V2-vI-8ZBCrlmR47x2upHud-5-eLJeUBkwjPCPJdxP=
iBG15x5ABC9UDZTf0pDE2WDsoSm3JNRVt6aA_c,&typo=3D1 b/meta-arago-distro/recipe=
s-core/images/https://linkprotect.cudasvc.com/url?a=3Dhttps%3a%2f%2ftisdk-b=
ase-image-sk.bb&c=3DE,1,bbeSsqS-Gta0okDgIaOmyf43SA9ZBo3zCMgtiJqU8ZQ4wJZ9RkN=
Oo4y7drx9edJeDWQvKyyLM81cczYW04mpyQ3q1rnnzrX1fMH1xFxc&typo=3D1
> > new file mode 100644
> > index 00000000..571e8395
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/https://linkprotect.cudasvc=
.com/url?a=3Dhttps%3a%2f%2ftisdk-base-image-sk.bb&c=3DE,1,MXierxaM4gcLM2Vus=
goZMip7BDPUnU7fXGgeaOdPsBVCFJ4CkbxzzOuJd07BZw0I22xa22QhijW-CTa1UPo_o1AyiQ37=
BPy0COZZAW1hHrdnL4E-NZmzT0A8rCRP&typo=3D1
> > @@ -0,0 +1,21 @@
> > +# Arago TI SDK base image with test tools
> > +# Suitable for initramfs
> > +
> > +require  recipes-core/images/https://linkprotect.cudasvc.com/url?a=3Dh=
ttps%3a%2f%2farago-image.inc&c=3DE,1,Lw4KWFU--NnUz1yO8vOcw-GCibeWmqjWWIJUuM=
dMfsOYEwEBv3i_FKicsWYFtQCBovl7Kamtqo6dD-vWmeKmZ4XaJ-Ewft7hUsnTksGM6iDhukZh&=
typo=3D1
> > +
> > +IMAGE_FSTYPES +=3D "cpio.xz"
> > +IMAGE_FSTYPES_append_dra7xx =3D " ubifs ubi"
> > +
> > +IMAGE_INSTALL +=3D "\
> > +    packagegroup-arago-base \
> > +    packagegroup-arago-console \
> > +    packagegroup-arago-base-tisdk \
> > +    ${VIRTUAL-RUNTIME_initramfs} \
> > +    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', 'ti-test', '', =
d)} \
> > +    "
> > +
> > +export IMAGE_BASENAME =3D "tisdk-base-image-sk"
> > +
> > +export IMAGE_BASENAME =3D "tisdk-base-image-sk"
>
> Duplicate?
>
>
> > +export IMAGE_LINK_NAME =3D "tisdk-base-image-am64xx-sk"
> > +export DEPLOY_DIR_IMAGE=3D"/mnt/4TB-VD1/ti_devm_sdk/devm_linux/am64x_s=
k/yocto_local_am64x_sk/oe-layersetup/build/arago-tmp-external-arm-glibc/dep=
loy/images/am64xx-evm/sk"
>
> I don't have "/mnt/4TB-VD1/..." - should not be an absolute path.
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://linkprotect.cudasvc.com/url?a=3Dhttps%3=
a%2f%2fdenix.org%2f0x420902729A92C964&c=3DE,1,9WvpEazDGkxStqNcGuaIVGOFqP-yX=
l09xP293Sba6x1z73wffjNpuQGjjT133SxXHSX9k8GLSjHiUU-sP7tDi6qpP3ez0geTBaricXMF=
w0p6ovK__w,,&typo=3D1
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

