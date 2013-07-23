Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A8DF052972
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 17:17:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NHHsML032613
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:17:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NHHsF4011818
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:17:54 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:17:54 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6NHHsfC000348;
	Tue, 23 Jul 2013 12:17:54 -0500
Date: Tue, 23 Jul 2013 13:17:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Hernandez, Carlos" <ceh@ti.com>
Message-ID: <20130723171753.GR31158@edge>
References: <1373040583-483-1-git-send-email-ceh@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E82D58B@DLEE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E82D58B@DLEE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Tue, 23 Jul 2013 17:17:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping.

On Sat, Jul 06, 2013 at 01:56:38PM +0000, Dmytriyenko, Denys wrote:
> PR bump?
> 
> 
> Denys
> 
> 
> -----Original Message-----
> From: Hernandez, Carlos [ceh@ti.com]
> Received: Friday, 05 Jul 2013, 12:09
> To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> Subject: [meta-arago] [PATCH] packagegroup-arago-test: Add memtester
> 
> memtester is a userspace utility for testing the memory subsystem.
> 
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index a52b84a..230b9af 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> @@ -15,6 +15,7 @@ ARAGO_TEST = "\
>      rt-tests \
>      evtest \
>      bc \
> +    memtester \
>      "
> 
>  ARAGO_TI_TEST = "\
> --
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


