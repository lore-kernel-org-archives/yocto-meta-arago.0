Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C2E7552978
	for <meta-arago@arago-project.org>;
	Thu, 10 May 2018 16:17:34 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4AGHUA2003378
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1525969050;
	bh=XBWkN2nT1ViNB0WYdrh7zd1j/Hv7aGZ73rIGP6xEvPM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hY3lWezdWLjxXTMBlt9RB1+UG33kTa/ck2x1Lo7J+zzOBhCgbgwfK5EUqtFKvtaQj
	VBtt6Ylwi2rZWnhyMnsBQhQA2pirH7Gd41RIXYDl+PTNl8iJ+5Ksty5lZkiCXuAt7s
	IjEljXA43cbFnI5UH2tv11KHmJkmKDPGhl84kuQo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGHUHK014056
	for <meta-arago@arago-project.org>; Thu, 10 May 2018 11:17:30 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 10 May 2018 11:17:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 10 May 2018 11:17:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4AGHT1O012208;
	Thu, 10 May 2018 11:17:30 -0500
Date: Thu, 10 May 2018 12:17:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180510161729.GJ31698@edge>
References: <1525962988-28642-1-git-send-email-j-stiffler@ti.com>
	<20180510154734.GI31698@edge>
	<75b90eb2-fe81-8e8a-d74c-d9c3ee915ada@ti.com>
MIME-Version: 1.0
In-Reply-To: <75b90eb2-fe81-8e8a-d74c-d9c3ee915ada@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] bitbake-test-sdk-image: preserve bitbake-cookerdaemon.log
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
X-List-Received-Date: Thu, 10 May 2018 16:17:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 10, 2018 at 12:15:21PM -0400, Jacob Stiffler wrote:
> 
> 
> On 5/10/2018 11:47 AM, Denys Dmytriyenko wrote:
> >On Thu, May 10, 2018 at 10:36:28AM -0400, Jacob Stiffler wrote:
> >>* When stdout/stderr is piped, if there is an error during parsing,
> >>   all that will be printed is "Unable to start bitbake server"
> >>* The bitbake-cookerdaemon.log will contain the error message, so
> >>   preserve it in the LOG_DIR.
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  lib/oesdk/bitbake-test-sdk-image | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >>diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
> >>index f17b594..de081cf 100644
> >>--- a/lib/oesdk/bitbake-test-sdk-image
> >>+++ b/lib/oesdk/bitbake-test-sdk-image
> >>@@ -465,6 +465,9 @@ bitbake_sdk_images(){
> >>              fi
> >>          done
> >>+        # Move the bitbake-cooker.log as some errors may get hidden in there.
> >>+        mv $build_dir/bitbake-cookerdaemon.log $LOG_DIR/$m-bitbake-cookerdaemon.log
> >What happens if the file doesn't exist?
> 
> There will be an error printed and an error code returned. The error
> code is not caught, so the script will proceed.
> 
> Would you prefer to first check if the file exists, or hide the
> error code with an "mv ... || true"?

Doesn't matter in this case, so mv || true is shorter and concise.


> >>          # Only run the build testing if the status of the above builds
> >>          # was "pass"
> >>          if [ "$build_status" == "pass" ]
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

