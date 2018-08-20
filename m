Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 22C9552A54
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 18:30:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7KIUF0U107053
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:30:15 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIUFE7008374
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2018 13:30:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 20 Aug 2018 13:30:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 20 Aug 2018 13:30:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7KIUEmG005028;
	Mon, 20 Aug 2018 13:30:15 -0500
Date: Mon, 20 Aug 2018 14:29:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180820182917.GE29422@beryl>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC 0/3] Add secondary toolchain to devkit
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
X-List-Received-Date: Mon, 20 Aug 2018 18:30:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 17, 2018 at 10:25:50AM -0400, Jacob Stiffler wrote:
> Add a method to install a second toolchain in the devkit for situation
> when a chip has multiple cores with different architectures.

I actually like how minimally invasive it is. Have you tested it?


> Jacob Stiffler (3):
>   external-linaro-secondary-sdk-toolchain: secondary toolchain for
>     devkit
>   packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
>   arago-prefs: enable SECONDARY_TOOLCHAIN
> 
>  meta-arago-distro/conf/distro/include/arago-prefs.inc                 | 3 +++
>  .../recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb      | 4 ++++
>  .../recipes-core/packagegroups/packagegroup-arago-cross-canadian.bb   | 4 ++++
>  3 files changed, 11 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-core/meta/external-linaro-secondary-sdk-toolchain.bb
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

