Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 7342852986
	for <meta-arago@arago-project.org>;
	Wed,  5 Mar 2014 03:28:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s253S1ua004417
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:28:01 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253S1po023273
	for <meta-arago@arago-project.org>; Tue, 4 Mar 2014 21:28:01 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 4 Mar 2014 21:28:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s253S0gL007048;
	Tue, 4 Mar 2014 21:28:00 -0600
Date: Tue, 4 Mar 2014 22:28:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140305032800.GW22125@edge>
References: <1392009919-696-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1392009919-696-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] libnl: Update bug fix patch and Add install append
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
X-List-Received-Date: Wed, 05 Mar 2014 03:28:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 10, 2014 at 12:25:19AM -0500, Sam Nelson wrote:
> - Bug fix patch for handling non-standard net mask
>   ( netmask not % 8)

Ok, so I can understand the patch need.


> - Add symbolic links for netlink & libraries

But why do you need those symlinks?


> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../libnl/files/fix_for_masking_addr.patch         |   40 ++++++++++++++++++++
>  .../libnl/libnl_3.2.21.bbappend                    |   16 ++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100755 meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
>  create mode 100755 meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend

Permissions are all wrong. Those files should not be executable - that's the 
result of editing files in Windows...


> diff --git a/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch b/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
> new file mode 100755
> index 0000000..1c139a2
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/libnl/files/fix_for_masking_addr.patch
> @@ -0,0 +1,40 @@
> +From a8e7c2270ef4dea85bb2f4f83951e240cc636417 Mon Sep 17 00:00:00 2001
> +From: Jingting Zhou <a0221004@ares-ubuntu>
> +Date: Fri, 11 Jan 2013 16:03:30 -0500
> +Subject: [PATCH] fix for addr masking
> +
> +---
> + lib/addr.c |   13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> + mode change 100644 => 100755 lib/addr.c
> +
> +diff --git a/lib/addr.c b/lib/addr.c
> +old mode 100644
> +new mode 100755

And even the source file gets the permissions changed.


> +index 3acd9e4..1d1c6c7
> +--- a/lib/addr.c
> ++++ b/lib/addr.c
> +@@ -526,11 +526,16 @@ int nl_addr_cmp_prefix(struct nl_addr *a, struct nl_addr *b)
> + 
> + 		d = memcmp(a->a_addr, b->a_addr, bytes);
> + 		if (d == 0) {
> +-			int mask = (1UL << (len % 8)) - 1UL;
> ++           if ((len % 8) != 0)
> ++		   {
> ++
> ++                int mask = (0xFFFFFFFF << (8 - (len % 8)));
> ++
> ++                d = (a->a_addr[bytes] & mask) -
> ++                    (b->a_addr[bytes] & mask);
> ++            }
> ++        }

Looks like indentation is all over the place. Use the original indentation of 
the source file you are patching. In this case the original used tabs and the 
added lines use spaces...


> + 
> +-			d = (a->a_addr[bytes] & mask) -
> +-			    (b->a_addr[bytes] & mask);
> +-		}
> + 	}
> + 
> + 	return d;
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend b/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend
> new file mode 100755
> index 0000000..4af3918
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/libnl/libnl_3.2.21.bbappend

In oe-core, libnl lives in recipes-support, not recipes-connectivity. It's 
recommended to use the same location for bbappends.


> @@ -0,0 +1,16 @@
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI += "\
> +	file://fix_for_masking_addr.patch \
> +"
> +
> +do_install_append() {
> +    cd ${D}${includedir}
> +    ln -sf libnl3/netlink netlink
> +    cd ${D}${libdir}
> +    ln -sf libnl-3.so.200 libnl.so
> +    ln -sf libnl-3.so.200 libnl.so.3
> +    ln -sf libnl-genl-3.so.200 libnl-genl.so
> +    ln -sf libnl-genl-3.so.200 libnl-genl.so.3

What is the reason for these links?


> +}
> +
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

