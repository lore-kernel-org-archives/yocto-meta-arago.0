Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 658265208B
	for <meta-arago@arago-project.org>;
	Wed,  3 Feb 2016 21:09:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u13L9CjI031259;
	Wed, 3 Feb 2016 15:09:12 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u13L9CN4006907;
	Wed, 3 Feb 2016 15:09:12 -0600
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0224.002; Wed, 3 Feb 2016 15:09:12 -0600
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] tisdk-image: add packaging of skern and
	k2-fw-initrd to prebuilt-images/
Thread-Index: AQHRXsXIxBr6p449mkybxE02r9eh6J8az67Q
Date: Wed, 3 Feb 2016 21:09:11 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814216A1E@DFLE09.ent.ti.com>
References: <1454533142-25375-1-git-send-email-denis@denix.org>
In-Reply-To: <1454533142-25375-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] tisdk-image: add packaging of skern and k2-fw-initrd to prebuilt-images/
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
X-List-Received-Date: Wed, 03 Feb 2016 21:09:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have a similar bbappend in meta-processor-sdk (http://arago-project.org/g=
it/projects/?p=3Dmeta-processor-sdk.git;a=3Dblob;f=3Drecipes-core/images/ar=
ago-core-tisdk-image.bbappend;h=3Df404874b03b090dd25ccb5a1459941d0d6f33e93;=
hb=3DHEAD).  I have not yet tried upstreaming it because I was hoping to th=
ink of a better way to copy the increasing number of images to "prebuilt-im=
ages".

One thing missing here from what I have is copying the "u-boot.gph" to preb=
uilt images. This is needed for keystone to be flashed to the board.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Wednesday, February 03, 2016 3:59 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] tisdk-image: add packaging of skern and k2-
> fw-initrd to prebuilt-images/
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass | 26
> +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-
> distro/classes/tisdk-image.bbclass
> index e5d5e50..86fbb58 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -56,6 +56,12 @@ DEPLOY_SPL_UART_NAME ?=3D "u-boot-spl.bin-
> ${MACHINE}"
>  # Variable to specify the name of the TI SCI firmware
> DEPLOY_TISCI_FW_NAME ?=3D "ti-sci-firmware-k2g.bin"
>=20
> +# Variable to specify the name of Keystone skern file (it has SOC in
> +the name, not MACHINE) DEPLOY_K2_SKERN_NAME ?=3D "skern-*.bin"
> +
> +# Variable to specify the name of Keystone initramfs with FW images
> +DEPLOY_K2_FW_INITRD_NAME ?=3D "k2-fw-initrd.cpio.gz"
> +
>  # Manifest file location which will be created as part of the image buil=
d  #
> process.
>  # This manifest follows the TI manifest format requirements which is why
> @@ -758,15 +764,33 @@ tisdk_image_build () {
>          fi
>      fi
>=20
> +    # Copy TI SCI firmware if it exists
>      if [ "${DEPLOY_TISCI_FW_NAME}" !=3D "" ]
>      then
> -        # Copy TI SCI firmware if it exists
>          if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME} ]
>          then
>              cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_TISCI_FW_NAME}
> ${prebuilt_dir}/
>          fi
>      fi
>=20
> +    # Copy skern/boot-monitor image if it exists
> +    if [ "${DEPLOY_K2_SKERN_NAME}" !=3D "" ]
> +    then
> +        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME} ]
> +        then
> +            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_SKERN_NAME}
> ${prebuilt_dir}/
> +        fi
> +    fi
> +
> +    # Copy Keystone FW initramfs image if it exists
> +    if [ "${DEPLOY_K2_FW_INITRD_NAME}" !=3D "" ]
> +    then
> +        if [ -e ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME} ]
> +        then
> +            cp ${DEPLOY_DIR_IMAGE}/${DEPLOY_K2_FW_INITRD_NAME}
> ${prebuilt_dir}/
> +        fi
> +    fi
> +
>      # Add the EXTRA_TISDK_FILES contents if they exist
>      # Make sure EXTRA_TISDK_FILES is not empty so we don't accidentaly
>      # copy the root directory.
> --
> 2.2.0
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

