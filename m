Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id F1FF9529ED
	for <meta-arago@arago-project.org>;
	Wed,  4 Oct 2017 15:06:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v94F6wkV028194
	for <meta-arago@arago-project.org>; Wed, 4 Oct 2017 10:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507129618;
	bh=/8JXOhc2ZqX77eRIqD6e0X9PK1aGZVkARBshdsruH8k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=iWSuGYqlKng42onzDgfoh9p50Gon8LCgPJuXDmP4u1phsRjUw5ZLIFv4IUkiIIaaq
	DJN1DV3plqc9sf+K9z4K3WTy0BfGt6LRNPsxS8eiLVGY0GYrtNFlElMqiVqrIHbxed
	Asb1jApSZkHpkY5aUUUqb6Cc+gtREFIg0gAoxt54=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v94F6wkL031225
	for <meta-arago@arago-project.org>; Wed, 4 Oct 2017 10:06:58 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 4 Oct 2017 10:06:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 4 Oct 2017 10:06:58 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v94F6wSd003954;
	Wed, 4 Oct 2017 10:06:58 -0500
To: Eric Ruei <e-ruei1@ti.com>, <meta-arago@arago-project.org>
References: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e56474eb-fdcc-bae3-65a2-ea4a26597181@ti.com>
Date: Wed, 4 Oct 2017 11:06:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1507064577-60360-1-git-send-email-e-ruei1@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH v3 0/2] Add X11 Build Support
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
X-List-Received-Date: Wed, 04 Oct 2017 15:06:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

These resolved the conflicts. I have push all 23 patches to the 
"morty-x11-experimental" of meta-processor-sdk.


On 10/3/2017 5:02 PM, Eric Ruei wrote:
> rebase the following two patches
>
> Eric Ruei (2):
>    packagegroup-arago-test-addons: remove omapdrmtest for X11(xsgx) build
>    packagegroup-arago-tisdk-addons(-sdk-target): removed unsupported
>      modules for X11(xsgx) build
>
>   .../packagegroups/packagegroup-arago-test-addons.bbappend      |  5 ++++-
>   .../packagegroup-arago-tisdk-addons-sdk-target.bbappend        | 10 ++++++----
>   .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 10 ++++++----
>   3 files changed, 16 insertions(+), 9 deletions(-)
>


