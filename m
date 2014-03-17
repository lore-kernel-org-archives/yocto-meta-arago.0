Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E49F152998
	for <meta-arago@arago-project.org>;
	Mon, 17 Mar 2014 18:49:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2HInUxu016448;
	Mon, 17 Mar 2014 13:49:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2HInUjU005306;
	Mon, 17 Mar 2014 13:49:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 17 Mar 2014 13:49:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2HInTXN020581;
	Mon, 17 Mar 2014 13:49:29 -0500
Date: Mon, 17 Mar 2014 14:49:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140317184929.GR12929@edge>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1393889779-3995-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 0/5] updates for several recent OpenTest framework changes
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
X-List-Received-Date: Mon, 17 Mar 2014 18:49:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping. Any objectsion to me pushing these patches in?


On Mon, Mar 03, 2014 at 06:36:14PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> There were several changes made in the OpenTest framework configuration and
> setup in the past few months, breaking compatibility with the old CLI client
> as well as several other assumptions made in the build scripts. This patchset
> updates the scripts with the new CLI and other config options to work with
> the new OpenTest framework setup again.
> 
> Denys Dmytriyenko (5):
>   run-opentest: make assigning tests to a specific TEE optional
>   run-opentest: pass test_scripts_root to always get latest vatf from
>     git
>   run-opentest: add support for new version of opentest CLI
>   linux-devtest.tgz: add new version of OpenTest CLI 13.11
>   arago-core-tisdk-dylan-puget: update to use new CLI
> 
>  configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
>  lib/run-opentest                         |   25 ++++++++++++++++++++++---
>  linux-devtest.tgz                        |  Bin 0 -> 505553 bytes
>  3 files changed, 24 insertions(+), 5 deletions(-)
>  create mode 100644 linux-devtest.tgz
> 
> -- 
> 1.7.9.5
> 

