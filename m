Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id DD39252981
	for <meta-arago@arago-project.org>;
	Fri, 12 Apr 2013 20:47:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3CKlVFX020388
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:47:31 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3CKlV2q023255
	for <meta-arago@arago-project.org>; Fri, 12 Apr 2013 15:47:31 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Fri, 12 Apr 2013 15:47:30 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/1] tisdk-image: add support for DTB files
Thread-Index: AQHON77gd3+vCSFpVEuGgcygw6HolJjTDlcA
Date: Fri, 12 Apr 2013 20:47:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594E5DD4@DLEE11.ent.ti.com>
References: <1365799613-23917-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1365799613-23917-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] tisdk-image: add support for DTB files
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
X-List-Received-Date: Fri, 12 Apr 2013 20:47:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Nevermind.  I'm going to update this with an if check.

Sincerely,
Chase Maupin
Integration Team Manager
Linux Core Product Development
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, April 12, 2013 3:47 PM
> To: meta-arago@arago-project.org
> Cc: Maupin, Chase
> Subject: [PATCH 1/1] tisdk-image: add support for DTB files
>=20
> * If DTB files exist add support for copying those files into
>   the SDK prebuilt-images directory.
> * The files to be copied can be controlled using the DTB_FILTER
>   variable.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta-arago-distro/classes/tisdk-image.bbclass |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass
> b/meta-arago-distro/classes/tisdk-image.bbclass
> index a1ce1ad..4e3ed52 100644
> --- a/meta-arago-distro/classes/tisdk-image.bbclass
> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
> @@ -528,6 +528,16 @@ do_sdk_image () {
>          return 1
>      fi
>=20
> +    # Copy the DTB files if they exist.
> +    # NOTE: For simplicity remove the uImage- prefix on the dtb
> files.  Get just the symlink
> +    #       files for a cleaner name.  Use the DTB_FILTER
> variable to allow finding the
> +    #       dtb files for only that MACHINE type
> +    for f in `find ${DEPLOY_DIR_IMAGE} -type l -name
> "*${DTB_FILTER}*.dtb"`
> +    do
> +        dtb_file=3D`basename $f | sed s/uImage-//`
> +        cp $f ${prebuilt_dir}/${dtb_file}
> +    done
> +
>      if [ "${SECONDARY_BOOTLOADER_NAME}" !=3D "" ]
>      then
>          # Copy the secondary bootloader image if it exists
> --
> 1.7.0.4


