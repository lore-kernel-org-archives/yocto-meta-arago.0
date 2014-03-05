Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5711F5208C
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:46:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253kL82029443
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:46:21 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253kLx5001488
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:46:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 21:46:21 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253kL3c018700;
	Tue, 4 Mar 2014 21:46:21 -0600
Date: Tue, 4 Mar 2014 22:46:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140305034620.GZ22125@edge>
References: <1392141117-22223-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392141117-22223-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2] vtun: Add new recipe for vtun
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
X-List-Received-Date: Wed, 05 Mar 2014 03:46:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2014 at 12:51:57PM -0500, Sam Nelson wrote:
> - Virtual Tunnels over TCP/IP networks with
>    traffic shaping, compression and encryption

Looks mostly good, just couple comments.


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> 
> ---
> Changes from previous patch
> * Updated LIC_FILES_CHECKSUM to use just the copyright lines
> ---
> ---
>  .../recipes-connectivity/vtun/vtun_3.0.3.bb        |   23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
> 
> diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
> new file mode 100755
> index 0000000..bb4d69d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Virtual Tunnels over TCP/IP networks with traffic shaping, compression and encryption."
> +HOMEPAGE = "http://vtun.sourceforge.net/"
> +SECTION = "console/network"
> +PRIORITY = "optional"

Drop PRIORITY please.


> +LICENSE = "GPLv2"
> +DEPENDS = "zlib lzo openssl"
> +PR = "r0"
> +LIC_FILES_CHKSUM = "file://vtun.h;startline=1;endline=17;md5=9ac9e7fefca60c72400239e0de40cde8"
> +
> +SRC_URI = "http://downloads.sourceforge.net/project/vtun/vtun/${PV}/vtun-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "f3becf2a0270910a841060c08d1db824"
> +SRC_URI[sha256sum] = "69dcbe4f8c5ce7d91b4150a6309e536d03b61841169746ca5788413ac7edb9cb"
> +
> +inherit autotools
> +
> +do_configure() {
> +	sed -i "s/\$BLOWFISH_HDR_DIR \/usr\/include\/ssl/\$BLOWFISH_HDR_DIR \/usr\/include\/ssl \$SSL_HDR_DIR/" configure
> +	oe_runconf --with-lzo-headers=${STAGING_INCDIR}/lzo --with-lzo-lib=${STAGING_LIBDIR} --with-ssl-headers=${STAGING_INCDIR}/openssl --with-ssl-lib=${STAGING_LIBDIR}
> +	sed '102d' Makefile > Makefile.new
> +	mv Makefile.new Makefile

What's the reason for the above 2 sed commands? A small comment before 
do_configure() explaining why you are doing that, would be great! Thanks.


> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

