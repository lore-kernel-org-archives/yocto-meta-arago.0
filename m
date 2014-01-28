Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1021D52972
	for <meta-arago@arago-project.org>;
	Tue, 28 Jan 2014 20:23:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0SKMw4w025216
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2014 14:22:58 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0SKMwXM021031
	for <meta-arago@arago-project.org>; Tue, 28 Jan 2014 14:22:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 28 Jan 2014 14:22:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0SKMwP7032711	for
	<meta-arago@arago-project.org>; Tue, 28 Jan 2014 14:22:58 -0600
Date: Tue, 28 Jan 2014 15:22:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140128202257.GG6814@edge>
References: <1390871192-3063-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1390871192-3063-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] php: amend URL with the new location of the source tarball
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
X-List-Received-Date: Tue, 28 Jan 2014 20:23:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any comments/questions/objections? Should I take it as silent Ack? :)


On Mon, Jan 27, 2014 at 08:06:32PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> index fb1c25d..ebf480c 100644
> --- a/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> +++ b/meta-arago-distro/recipes-devtools/php/php_5.4.14.bbappend
> @@ -1,10 +1,13 @@
>  # look for files in this layer first
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
> -PR_append = "-arago1"
> +PR_append = "-arago2"
>  
>  SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
>  
> +python __anonymous () {
> +    d.setVar("SRC_URI", d.getVar("SRC_URI").replace('http://www.php.net/distributions/php-${PV}.tar.bz2', 'http://museum.php.net/php5/php-${PV}.tar.bz2'))
> +}
>  
>  # Work around to address the fact that php-fpm and php-cgi can not coexist
>  # php-cgi is used by Matrix and php-fpm is in beta for this version of php.
> -- 
> 1.8.3.2
> 

