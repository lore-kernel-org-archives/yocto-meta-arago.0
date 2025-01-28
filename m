Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF410C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 21:02:09 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.8092.1738098127873634736
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 13:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tWzpeDr8;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50SL256i1248483
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 15:02:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738098125;
	bh=d/kwHI962R6uVBKw7dX2x+9rIo3ZVPbbaXq6lIxUtk4=;
	h=Date:Subject:References:To:CC:From:In-Reply-To;
	b=tWzpeDr8Izkus7pToBtr2wP1r/wBlTvhnw0WSddHZtkpOQPqnz+aVEiwF0jm0YDTD
	 Rcwfd9mwIh4fKgjm6Oe3c6jUu6hu3Q9ReEiCuS328j1siwZqWRW3Hf8lL9ey9TQ0Xk
	 8cpT4hFU7Mp+TLo90465Rc3AeufZP8mCv2ZSE3hM=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50SL25Fx060703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Jan 2025 15:02:05 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 28
 Jan 2025 15:02:04 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 28 Jan 2025 15:02:04 -0600
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50SL24Xc025133;
	Tue, 28 Jan 2025 15:02:04 -0600
Message-ID: <871f0734-91d6-414f-ab4d-239d8610f3ec@ti.com>
Date: Tue, 28 Jan 2025 15:02:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap/master][PATCH v2]
 meta-arago-test: Add recipe for pytesseract
References: <181EF6DEE0BA49D7.20803@lists.yoctoproject.org>
Content-Language: en-US
To: <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <181EF6DEE0BA49D7.20803@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 50SL256i1248483
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Jan 2025 21:02:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15773

Dear Denys,

V2 of the patch. Thank you for the feedback.

Kind Regards,

Antonios

On 1/28/25 2:59 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@=E2=80=8Ati.=E2=80=8Acom> Recip=
e builds the=20
> python module pytessereact, version 0.=E2=80=8A3.=E2=80=8A13. The modul=
e is a wrapper=20
> for Google's Tesseract-OCR engine. Signed-off-by: Antonios Christidis=20
> <a-christidis@=E2=80=8Ati.=E2=80=8Acom> ---
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uVdqPBeh2K3VpKjEM=
p2jXdGaMnloE5cDA8cp1RM4GXwKtgPNjatnDZE2YlrUrU3384G8qHBA2QhRu-oFcqo4i_AUVI=
lSEUk$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Antonios Christidis <a-christidis@ti.com>
>
> Recipe builds the python module pytessereact, version 0.3.13.
>
> The module is a wrapper for Google's Tesseract-OCR engine.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../python3-pytesseract/pytesseract_0.3.13.bb    | 16 +++++++++++++++=
+
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/python3-pytessera=
ct/pytesseract_0.3.13.bb
>
> diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytes=
seract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/p=
ytesseract_0.3.13.bb
> new file mode 100644
> index 00000000..f63e9fd9
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_=
0.3.13.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Python-tesseract is a python wrapper for Google's Tessera=
ct"
> +
> +DESCRIPTION =3D "Python-tesseract is an optical character recognition =
(OCR) tool for python. That is, it will recognize and "read" the text emb=
edded in images."
> +
> +HOMEPAGE =3D "https://urldefense.com/v3/__https://github.com/madmaze/p=
ytesseract__;!!G3vK!QX2dWAQLtaoacDR5-qZrFlAVSNPpsWRix5T_wWYp9jD3yUvS8fK8C=
CPzP77Q1ECZLr_pX7wPiXzUcPS7DahYH6W6uhJGpOEHN_O8$"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D86d3f3a95c324c9479bd8986968=
f4327"
> +
> +SRC_URI[sha256sum] =3D "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a50=
9d74867d3baddb5db9"
> +
> +PYPI_PACKAGE =3D "pytesseract"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15772):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15772__;!!G3vK!QX2dWAQLtaoacDR5-qZrFl=
AVSNPpsWRix5T_wWYp9jD3yUvS8fK8CCPzP77Q1ECZLr_pX7wPiXzUcPS7DahYH6W6uhJGpAf=
tOCVi$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/110866884/9164840__;!!G3vK!QX2dWAQLtaoacDR5-qZrFlAVSNPpsWRix5T_wWY=
p9jD3yUvS8fK8CCPzP77Q1ECZLr_pX7wPiXzUcPS7DahYH6W6uhJGpJnnatZB$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!QX2dWAQLtaoacDR5-qZrFlAVSNPpsWRix5T_wWYp9jD3y=
UvS8fK8CCPzP77Q1ECZLr_pX7wPiXzUcPS7DahYH6W6uhJGpNz61b8b$  [a-christidis@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

