Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D2914529C2
	for <meta-arago@arago-project.org>;
	Tue, 23 Sep 2014 15:58:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NFwQD9018898
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:58:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFwQYb004274
	for <meta-arago@arago-project.org>; Tue, 23 Sep 2014 10:58:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 10:58:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NFwPEu001790;
	Tue, 23 Sep 2014 10:58:25 -0500
Date: Tue, 23 Sep 2014 11:58:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140923155825.GM6303@edge>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1411487426-31949-1-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [for master 0/5] GFX/MM patches from meta-glsdk layer
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
X-List-Received-Date: Tue, 23 Sep 2014 15:58:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Except #4, the rest have my Ack.

On Tue, Sep 23, 2014 at 09:20:21PM +0530, Karthik Ramanan wrote:
> This patch set contains the first set of patches upstreamed to 
> meta-arago from meta-glsdk.
> 
> Each of these patches can be independently applied in any order.
> 
> Karthik Ramanan (5):
>   gst-plugins-vpe: Bug fixes and feature additions
>   gst-plugins-ducati: Support encoder and bug fix updates
>   libdce: Single planar encode support
>   example-applications: Adding repository of GLSDK example applications
>   omapdrmtest: Added new tests and bug fixes.
> 
>  .../example-applications/example-applications.bb   |   15 +++++++++++++++
>  .../omapdrmtest/omapdrmtest_1.0.0.bb               |    6 +++---
>  .../gst-plugins-ti/gst-plugins-ducati_git.bb       |    4 ++--
>  .../gst-plugins-ti/gst-plugins-vpe_git.bb          |    4 ++--
>  .../recipes-multimedia/libdce/libdce_git.bb        |    4 ++--
>  5 files changed, 24 insertions(+), 9 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-graphics/example-applications/example-applications.bb
> 
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

