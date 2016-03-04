Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2D98A52AC6
	for <meta-arago@arago-project.org>;
	Fri,  4 Mar 2016 17:07:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u24H7kVn019288
	for <meta-arago@arago-project.org>; Fri, 4 Mar 2016 11:07:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24H7a4F014311
	for <meta-arago@arago-project.org>; Fri, 4 Mar 2016 11:07:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Mar 2016 10:57:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u24GvclQ012433;
	Fri, 4 Mar 2016 10:57:38 -0600
Date: Fri, 4 Mar 2016 11:57:22 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20160304165722.GA7505@edge>
References: <1457075004-18964-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1457075004-18964-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: Update SRCREV
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
X-List-Received-Date: Fri, 04 Mar 2016 17:07:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Nak, please rebase your copy.

On Fri, Mar 04, 2016 at 12:33:24PM +0530, Karthik Ramanan wrote:
> This update brings in two feature additions:
>  * Ability to provide the start position by setting the title
>  * Add crop support to waylandsink
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> index 831b8ac..9b0cdcd 100644
> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
> @@ -16,7 +16,7 @@ SRC_URI = "git://git.ti.com/glsdk/gstreamer1-0-plugins-bad.git;protocol=git \
>  
>  S = "${WORKDIR}/git"
>  
> -SRCREV = "12b0d2ac50aba19da53d2e1ac40d6ada70a79930"
> +SRCREV = "9396248f2daf0b28b83ab0f01c4d17a8af46b1ca"
>  
> -PR_append = "-arago5"
> +PR_append = "-arago6"
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

