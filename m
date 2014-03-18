Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 17ADF52A61
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 14:21:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IELwNJ007321;
	Tue, 18 Mar 2014 09:21:58 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IELwPo031594;
	Tue, 18 Mar 2014 09:21:58 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 18 Mar 2014 09:21:57 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [tisdk-build-scripts][PATCH 3/5] run-opentest:
	add support for new version of opentest CLI
Thread-Index: AQHPNzl6ujN9PqzJZ0iYjdrN2Qkxcprm/CoA
Date: Tue, 18 Mar 2014 14:21:57 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C668581@DFLE08.ent.ti.com>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-4-git-send-email-denis@denix.org>
In-Reply-To: <1393889779-3995-4-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [tisdk-build-scripts][PATCH 3/5] run-opentest: add support for new version of opentest CLI
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
X-List-Received-Date: Tue, 18 Mar 2014 14:21:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Monday, March 03, 2014 5:36 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [tisdk-build-scripts][PATCH 3/5] run-opentest: add
> support for new version of opentest CLI
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  lib/run-opentest |   17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/run-opentest b/lib/run-opentest index bf779e8..9a8e45b
> 100644
> --- a/lib/run-opentest
> +++ b/lib/run-opentest
> @@ -139,9 +139,20 @@ run_target_side_test() {
>          return 1
>      fi
>=20
> -    # Extrace the CLI utility
> +    # Extract the CLI utility
>      tar xf $OPENTEST_CLI
>=20
> +    # New version of CLI has "client" subdir
> +    mv client/* . || true
> +
> +    # New version of CLI has no version in JAR name
> +    if [ -e opentest_cli_0.7.jar ]
> +    then
> +        OPENTEST_JAR=3D"opentest_cli_0.7.jar"
> +    else
> +        OPENTEST_JAR=3D"opentest_cli.jar"
> +    fi
> +
>      # Determine the oplatform to use for testing
>      set_opentest_platform $m
>=20
> @@ -228,8 +239,8 @@ run_target_side_test() {
>      fi
>=20
>      # Call opentest framework.  Echo the command being used for logging
> -    echo "java -jar opentest_cli_0.7.jar --template penguin --hw
> platform=3D$oplatform,$OPENTEST_HW_CAP --sw
> kernel=3D$kernel$dtb~kernel_modules=3D$spluart$uboot~nfs=3D$ipaddr:$nfs_d=
ir$A
> SSIGN_TO_TEE~test_scripts_root=3Dgit://http://arago-
> project.org/git/projects/test-automation/execution-engines/vatf-scripts.g=
it --
> params script=3D/$TEST_SCRIPTS_TGT/opentest.sh"
> -    java -jar opentest_cli_0.7.jar --template penguin --hw
> platform=3D$oplatform,$OPENTEST_HW_CAP --sw
> kernel=3D$kernel$dtb~kernel_modules=3D$spluart$uboot~nfs=3D$ipaddr:$nfs_d=
ir$A
> SSIGN_TO_TEE~test_scripts_root=3Dgit://http://arago-
> project.org/git/projects/test-automation/execution-engines/vatf-scripts.g=
it --
> params script=3D/$TEST_SCRIPTS_TGT/opentest.sh
> +    echo "java -jar $OPENTEST_JAR --template penguin --hw
> platform=3D$oplatform,$OPENTEST_HW_CAP --sw
> kernel=3D$kernel$dtb~kernel_modules=3D$spluart$uboot~nfs=3D$ipaddr:$nfs_d=
ir$A
> SSIGN_TO_TEE~test_scripts_root=3Dgit://http://arago-
> project.org/git/projects/test-automation/execution-engines/vatf-scripts.g=
it --
> params script=3D/$TEST_SCRIPTS_TGT/opentest.sh"
> +    java -jar $OPENTEST_JAR --template penguin --hw
> + platform=3D$oplatform,$OPENTEST_HW_CAP --sw
> + kernel=3D$kernel$dtb~kernel_modules=3D$spluart$uboot~nfs=3D$ipaddr:$nfs=
_dir$
> + ASSIGN_TO_TEE~test_scripts_root=3Dgit://http://arago-project.org/git/pr=
o
> + jects/test-automation/execution-engines/vatf-scripts.git --params
> + script=3D/$TEST_SCRIPTS_TGT/opentest.sh
>=20
>=20
> #################################################################
> ###############
>  # Check the results of the opentest run.
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

