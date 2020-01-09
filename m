Return-Path: <yuanzhao@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7FD5952995
	for <meta-arago@arago-project.org>;
	Thu,  9 Jan 2020 23:20:32 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009NIlmY002763
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2020 17:18:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578611927;
	bh=o4ffa62LCb1qmIJtqWEeqaICKo5DPhPigRnvJFMaJJU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=EtQyBa54RNN2FRmZ721xRCDlSq/4ZxUzW1ExeBDHVchmRKL9Jv2zpkaWwTjmfPX/n
	dbET/MSh8w6hvpDHf6nx4FSCdQC11WsElMd9ZL25OKQbTpE0w12VuVdXOi8z1eZyJX
	HmMe4m1zIGNbDtqhYiCFXwHNVyvkyPhCvnvUQGgE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 009NIlGl077189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 9 Jan 2020 17:18:47 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 9 Jan 2020 17:18:47 -0600
Received: from DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0]) by
	DLEE103.ent.ti.com ([fe80::b585:e28:33f:1ca0%18]) with mapi id
	15.01.1847.003; Thu, 9 Jan 2020 17:18:47 -0600
From: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tidl-api: update BBAI mcbench script
Thread-Index: AQHVxk4LFnP+SJJPYUqtpVvDcONYpKfjXEmA//+ccDA=
Date: Thu, 9 Jan 2020 23:18:47 +0000
Message-ID: <aaa2988f9bdf4dfd95967cea6d6e6d6a@ti.com>
References: <20200108180412.117869-1-yuanzhao@ti.com>
	<20200109231143.GP2305@beryl>
In-Reply-To: <20200109231143.GP2305@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.219.48.216]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Robey,
	Caleb" <c-robey@ti.com>
Subject: Re: [PATCH] tidl-api: update BBAI mcbench script
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
X-List-Received-Date: Thu, 09 Jan 2020 23:20:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No SRCREV bump yet.  The accepted commit stays on our internal develop bran=
ch.  It will be externally visible next time we make a tidl-api release (th=
is one missed the PSDK 6.2 window).  - Yuan

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, January 9, 2020 5:12 PM
To: Zhao (Compiler), Yuan
Cc: meta-arago@arago-project.org; Robey, Caleb
Subject: Re: [meta-arago] [PATCH] tidl-api: update BBAI mcbench script

On Wed, Jan 08, 2020 at 12:04:12PM -0600, Yuan Zhao wrote:
> Signed-off-by: Caleb Robey <a0232989@ti.com>
> Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> ---
>  ...p-2-group-layer-use-cases-with-1-dsp.patch | 34 +++++++++++++++++++
>  .../recipes-ti/tidl-api/tidl-examples_git.bb  |  3 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-repl=
ace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
>=20
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-d=
sp-2-group-layer-use-cases-with-1-dsp.patch b/meta-arago-extras/recipes-ti/=
tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> new file mode 100644
> index 00000000..0c78ccf0
> --- /dev/null
> +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-gr=
oup-layer-use-cases-with-1-dsp.patch
> @@ -0,0 +1,34 @@
> +tidl-api: replace 2 dsp + 2 group layer use cases with 1 dsp
> +
> +    The BBAI only has enough CMEM for 4 EVEs, 1 DSP, and 2 group
> +    layers. In the case of all of our networks, the difference between
> +    1 and 2 dsps is essentially nonexistent. (PLSDK-3189)
> +
> +Upstream-Status: Accepted

Since the patch is marked as "Accepted", shouldn't a simple SRCREV bump be=
=20
enough?


> +Signed-off-by: Caleb Robey <a0232989@ti.com>
> +Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> +---
> + examples/mcbench/scripts/all_5729.sh | 9 ++++-----
> + 1 file changed, 4 insertions(+), 5 deletions(-)
> +
> +diff --git a/examples/mcbench/scripts/all_5729.sh b/examples/mcbench/scr=
ipts/all_5729.sh
> +index defec72..0fee8a1 100755
> +--- a/examples/mcbench/scripts/all_5729.sh
> ++++ b/examples/mcbench/scripts/all_5729.sh
> +@@ -7,8 +7,7 @@ export TIDL_NETWORK_HEAP_SIZE_DSP=3D56623104
> + export TIDL_NETWORK_HEAP_SIZE_EVE=3D67108864
> + export TIDL_NETWORK_HEAP_SIZE_DSP=3D8388608
> + ./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_m=
obileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_m=
obileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_m=
obileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_i=
nceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_mul=
ti.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j=
11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j=
11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi=
.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_m=
obileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_i=
nceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_mul=
ti.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j=
11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j=
11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi=
.y
> +--=20
> +2.17.1
> +
> diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b=
/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> index c7016ad5..e5afad1c 100644
> --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> @@ -6,7 +6,8 @@ LICENSE =3D "BSD"
>  include tidl-api.inc
>  require recipes-ti/includes/ti-paths.inc
> =20
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
> +SRC_URI +=3D "file://0002-replace-2-dsp-2-group-layer-use-cases-with-1-d=
sp.patch"
> =20
>  COMPATIBLE_MACHINE =3D "dra7xx"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> --=20
> 2.24.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

