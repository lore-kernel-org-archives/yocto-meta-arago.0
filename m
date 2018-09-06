Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 30B6E52985
	for <meta-arago@arago-project.org>;
	Thu,  6 Sep 2018 16:53:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w86GrOm3046885
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536252804;
	bh=tty227yYVQ58d4TCUtP8f6i+N3H64w9clKFJMGMxyGc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=n0I5yJevkPBWv5WnaoZ6JjQN4wqJO+e0z8PojMizZ5w2LhJcRRRNK3JJyi8O6vIlx
	kECunbpwZob3zD26K+RlEoC9KhnJRxicvFyihRz1/Zv6cCm5pY7qIcI5Xb6daTfG1a
	u/5jBsbAWoIYyTTpJY10TEJEd7+JYuV2XRRPmYwc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86GrOIW032065
	for <meta-arago@arago-project.org>; Thu, 6 Sep 2018 11:53:24 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 6 Sep 2018 11:53:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 6 Sep 2018 11:53:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w86GrNVg003528;
	Thu, 6 Sep 2018 11:53:23 -0500
Date: Thu, 6 Sep 2018 12:51:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <a0271529@ti.com>
Message-ID: <20180906165150.GP13472@beryl>
References: <1536252607-7772-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536252607-7772-1-git-send-email-a0271529@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [apps-tida01555] [PATCH] ARM_User_Space_App: Makefile: remove ARM_CCT and use CC
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
X-List-Received-Date: Thu, 06 Sep 2018 16:53:32 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What's apps-tida01555 and does it have to be posted to meta-arago?


On Thu, Sep 06, 2018 at 12:50:07PM -0400, Hongmei Gou wrote:
> * CC is defined from Processor SDK Linux
> 
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>  ARM_User_Space_App/Makefile | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
> 
> diff --git a/ARM_User_Space_App/Makefile b/ARM_User_Space_App/Makefile
> index 1ad4b2e..50ad7a8 100644
> --- a/ARM_User_Space_App/Makefile
> +++ b/ARM_User_Space_App/Makefile
> @@ -1,20 +1,3 @@
> -# ARM_CCT environment variable must point to the ARM cross-compile toolchain. E.g.:
> -#(Desktop Linux) export ARM_CCT=$(HOME)/ti-processor-sdk-linux-rt-amxxx-evm-ww.xx.yy.zz/
> -#linux-devkit/sysroots/x86_64-arago-linux/usr/bin
> -
> -ifndef ARM_CCT
> -define ERROR_BODY
> -
> -*******************************************************************************
> -ARM_CCT environment variable is not set. Examples given:
> -(Desktop Linux) export ARM_CCT=$(HOME)/ti-processor-sdk-linux-rt-amxxx-evm-ww.xx.yy.zz/
> -linux-devkit/sysroots/x86_64-arago-linux/usr/bin
> -*******************************************************************************
> -
> -endef
> -$(error $(ERROR_BODY))
> -endif
> -
>  MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
>  CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
>  PROJ_NAME=$(CURRENT_DIR)
> @@ -47,7 +30,7 @@ $(TARGET):
>  	@echo ''
>  	@echo 'Building target: $@'
>  	@echo 'Invoking: ARM x86 Cross Compiler'
> -	$(ARM_CCT)/arm-linux-gnueabihf-gcc -Wall $(SOURCES) $(CFLAGS) -o $(TARGET) -lncurses -lpthread
> +	$(CC) -Wall $(SOURCES) $(CFLAGS) -o $(TARGET) -lncurses -lpthread
>  	@echo 'Finished building target: $@'
>  
>  .PHONY: all clean
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

