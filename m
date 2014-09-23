Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DB26F529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 20:40:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NKebre001626;
	Tue, 23 Sep 2014 15:40:37 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NKebfh031593;
	Tue, 23 Sep 2014 15:40:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 23 Sep 2014 15:40:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] libdrm: patch modetest for indefinite
	test	execution
Thread-Index: AQHP12nlxW4+myAOr0aPYR/oW2sEj5wPLmnw
Date: Tue, 23 Sep 2014 20:40:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C73BC9D@DFLE08.ent.ti.com>
References: <1411502780-6569-1-git-send-email-denis@denix.org>
In-Reply-To: <1411502780-6569-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH] libdrm: patch modetest for indefinite test	execution
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
X-List-Received-Date: Tue, 23 Sep 2014 20:40:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> Sent: Tuesday, September 23, 2014 3:06 PM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] libdrm: patch modetest for indefinite test
> execution
>=20
> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...001-Add-option-to-run-a-test-indefinitely.patch | 77
> ++++++++++++++++++++++
>  .../recipes-graphics/drm/libdrm_2.4.52.bbappend    |  5 ++
>  2 files changed, 82 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-
> Add-option-to-run-a-test-indefinitely.patch
>  create mode 100644 meta-arago-distro/recipes-
> graphics/drm/libdrm_2.4.52.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-
> option-to-run-a-test-indefinitely.patch b/meta-arago-distro/recipes-
> graphics/drm/libdrm/0001-Add-option-to-run-a-test-indefinitely.patch
> new file mode 100644
> index 0000000..5aba3ed
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm/0001-Add-option-to-r
> +++ un-a-test-indefinitely.patch
> @@ -0,0 +1,77 @@
> +From 73c1849ac1492cd527263e9ef5033601018f52bf Mon Sep 17 00:00:00
> 2001
> +From: Alejandro Hernandez <ajhernandez@ti.com>
> +Date: Tue, 23 Sep 2014 09:30:24 -0400
> +Subject: [PATCH] Add option to run a test indefinitely
> +
> +This patch adds option -t to the modetest cli. When this option is
> +speficied modetest will not stop on stdin input. This patch allows
> +using modetest within ltp-ddt, before this patch modetest was not able
> +to run in ltp-ddt because ltp-ddt sends data to stdin when a test is
> +run
> +
> +Signed-off-by: Alejandro Hernandez <ajhernandez@ti.com>
> +---
> + tests/modetest/modetest.c | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> +index bc9c998..d847508 100644
> +--- a/tests/modetest/modetest.c
> ++++ b/tests/modetest/modetest.c
> +@@ -1104,7 +1104,7 @@ static void set_planes(struct device *dev, struct
> plane_arg *p, unsigned int cou
> + 			return;
> + }
> +
> +-static void test_page_flip(struct device *dev, struct pipe_arg *pipes,
> +unsigned int count)
> ++static void test_page_flip(struct device *dev, struct pipe_arg *pipes,
> ++unsigned int count, int dont_stop)
> + {
> + 	uint32_t handles[4], pitches[4], offsets[4] =3D {0}; /* we only use [0=
] */
> + 	unsigned int other_fb_id;
> +@@ -1182,7 +1182,7 @@ static void test_page_flip(struct device *dev,
> struct pipe_arg *pipes, unsigned
> + 			fprintf(stderr, "select timed out or error (ret %d)\n",
> + 				ret);
> + 			continue;
> +-		} else if (FD_ISSET(0, &fds)) {
> ++		} else if (!dont_stop && FD_ISSET(0, &fds)) {
> + 			break;
> + 		}
> + #endif
> +@@ -1376,7 +1376,7 @@ static int page_flipping_supported(void)  #endif
> +}
> +
> +-static char optstr[] =3D "cdD:efM:P:ps:vw:";
> ++static char optstr[] =3D "cdD:efM:P:ps:vw:t";
> +
> + int main(int argc, char **argv)
> + {
> +@@ -1391,6 +1391,7 @@ int main(int argc, char **argv)
> + 	char *module =3D NULL;
> + 	unsigned int i;
> + 	int count =3D 0, plane_count =3D 0;
> ++  int dont_stop=3D 0;
> + 	unsigned int prop_count =3D 0;
> + 	struct pipe_arg *pipe_args =3D NULL;
> + 	struct plane_arg *plane_args =3D NULL;
> +@@ -1472,6 +1473,9 @@ int main(int argc, char **argv)
> +
> + 			prop_count++;
> + 			break;
> ++    case 't':
> ++      dont_stop =3D 1;
> ++      break;
> + 		default:
> + 			usage(argv[0]);
> + 			break;
> +@@ -1547,7 +1551,7 @@ int main(int argc, char **argv)
> + 			set_planes(&dev, plane_args, plane_count);
> +
> + 		if (test_vsync)
> +-			test_page_flip(&dev, pipe_args, count);
> ++			test_page_flip(&dev, pipe_args, count, dont_stop);
> +
> + 		if (drop_master)
> + 			drmDropMaster(dev.fd);
> +--
> +1.9.1
> +
> diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappen=
d
> b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend
> new file mode 100644
> index 0000000..f593fb9
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/drm/libdrm_2.4.52.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI +=3D "file://0001-Add-option-to-run-a-test-indefinitely.patch"
> +
> +PR_append =3D "-arago0"
> --
> 2.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

