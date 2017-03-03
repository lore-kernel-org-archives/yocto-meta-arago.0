Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id B12DF52AF9
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 19:05:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23J5jHf017000
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:05:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488567945;
	bh=FXnUXZ1tbupHyAICjKuHOwsHvlHMsAzpE/n2kSmTVWQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tZtWle298lHN+TUhTtUo4HDTTHzTgadHKMY1JeAdjy8wqVHm4cAIKNnHtTJrvzyIu
	nwF5T6KaX2CyVCZ9QiD6i96Eh6LsDsT+GOkYICzzQSz43uEzvXkbVfVouYTLYqW4Ki
	rRBAmJsr7DKaD+ohoQHMNWijC9r47Nvaze30qBUk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23J5jqA031990
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 13:05:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 13:05:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23J5ihp001051;
	Fri, 3 Mar 2017 13:05:45 -0600
Date: Fri, 3 Mar 2017 14:05:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20170303190544.GI12614@edge>
References: <1488551149-39460-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1488551149-39460-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, yan-liu@ti.com
Subject: Re: [PATCH 1/2] ltp-ddt: remove scheduler trace patch no longer required
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
X-List-Received-Date: Fri, 03 Mar 2017 19:05:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This will break bisect-ability - since removing the patch either before or 
after the upgrade can cause breakage, the only way is to do it in the same 
commit as the upgrade itself. Sure, commits have to be as granular, as 
possible, but at the same time they should be atomic.


On Fri, Mar 03, 2017 at 09:25:48AM -0500, Carlos Hernandez wrote:
> Latest version of ltp fixes the problem and the patch
> 0029-trace_shed-Fix-build-with-musl.patch no longer applies.
> 
> Signed-off-by: Carlos Hernandez <ceh@ti.com>
> ---
>  .../0029-trace_shed-Fix-build-with-musl.patch      | 32 ----------------------
>  .../recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb   |  3 +-
>  2 files changed, 1 insertion(+), 34 deletions(-)
>  delete mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
> deleted file mode 100644
> index f7ece9e18ef0..000000000000
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0029-trace_shed-Fix-build-with-musl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 2f8a57f66a94210d34dd0361659a8297cf3d813f Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 8 Jan 2016 07:29:24 +0000
> -Subject: [PATCH 29/32] trace_shed: Fix build with musl
> -
> -Errors on musl are
> -
> -trace_sched.c:425:16: error: invalid operands to binary & (have
> -'thread_sched_t * {aka struct <anonymous> *}' and 'int')
> -      thrd_ndx, WEXITSTATUS(status));
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - testcases/kernel/sched/tool/trace_sched.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/sched/tool/trace_sched.c b/testcases/kernel/sched/tool/trace_sched.c
> -index 7815686..30dca5f 100644
> ---- a/testcases/kernel/sched/tool/trace_sched.c
> -+++ b/testcases/kernel/sched/tool/trace_sched.c
> -@@ -422,7 +422,7 @@ int main(int argc,		/* number of input parameters.                        */
> - 			if (status == (thread_sched_t *) - 1) {
> - 				fprintf(stderr,
> - 					"thread [%d] - process exited with errors %d\n",
> --					thrd_ndx, WEXITSTATUS(status));
> -+					thrd_ndx, WEXITSTATUS((int)status));
> - 				exit(-1);
> - 			} else {
> - 				exp_prio[thrd_ndx] = status->exp_prio;
> --- 
> -2.7.0
> -
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> index 22b962141dba..3bb17c8f8535 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
> @@ -17,8 +17,7 @@ inherit autotools-brokensep
>  SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
>  BRANCH ?= "master"
>  
> -SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
> -    file://0029-trace_shed-Fix-build-with-musl.patch"
> +SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

