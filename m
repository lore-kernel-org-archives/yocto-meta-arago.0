Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 281AC5297F
	for <meta-arago@arago-project.org>;
	Mon, 19 Jan 2015 23:39:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0JNdowq029961
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 17:39:50 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JNdoUn003299
	for <meta-arago@arago-project.org>; Mon, 19 Jan 2015 17:39:50 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 Jan 2015 17:39:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0JNdoBl011209;
	Mon, 19 Jan 2015 17:39:50 -0600
Date: Mon, 19 Jan 2015 18:39:49 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150119233949.GN16771@edge>
References: <1421636929-10691-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1421636929-10691-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for daisy] packagegroup-arago-test: Deprecate bltsville test
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
X-List-Received-Date: Mon, 19 Jan 2015 23:39:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Any particular reason you want to mention in the description?


On Mon, Jan 19, 2015 at 08:38:48AM +0530, Karthik Ramanan wrote:
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index 6af1321..67f51e4 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> @@ -40,7 +40,6 @@ ARAGO_TI_TEST_append_omap-a15 = " \
>      omapconf \
>      ipc-test-fw \
>      ${@base_contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
> -    bvtest \
>      "
>  
>  ARAGO_TI_TEST_append_dra7xx = " \
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

