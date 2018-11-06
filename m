Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BB7BA52981
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 19:42:45 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wA6JgaAC016440
	for <meta-arago@arago-project.org>; Tue, 6 Nov 2018 13:42:36 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wA6JgaWx122730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 6 Nov 2018 13:42:36 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 6 Nov 2018 13:42:35 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 6 Nov 2018 13:42:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wA6JgZip028992;
	Tue, 6 Nov 2018 13:42:35 -0600
Date: Tue, 6 Nov 2018 14:42:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20181106194234.GV27560@beryl>
References: <1540907045-1534-1-git-send-email-j-stiffler@ti.com>
	<55f039c6-e736-2aef-3e60-25851e8549b9@ti.com>
MIME-Version: 1.0
In-Reply-To: <55f039c6-e736-2aef-3e60-25851e8549b9@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH] tisdk.xml: add Ubuntu 18.04 to recommended distros
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
X-List-Received-Date: Tue, 06 Nov 2018 19:42:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sorry, missed that one - merged now.

On Tue, Nov 06, 2018 at 09:29:59AM -0500, Jacob Stiffler wrote:
> Ping.
> 
> On 10/30/2018 9:44 AM, Jacob Stiffler wrote:
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >---
> >  installer-files/tisdk.xml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/installer-files/tisdk.xml b/installer-files/tisdk.xml
> >index e763f1e..52f235f 100644
> >--- a/installer-files/tisdk.xml
> >+++ b/installer-files/tisdk.xml
> >@@ -70,7 +70,7 @@
> >              <title>Linux Environment Support Message</title>
> >              <description></description>
> >              <explanation></explanation>
> >-            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04 or Ubuntu 16.04 distribution environment. This is the environment that was used to develop and test this SDK.
> >+            <value>It is highly recommend that the user, or especially new users, install this SDK into a Ubuntu 14.04, Ubuntu 16.04, or Ubuntu 18.04 distribution environment. This is the environment that was used to develop and test this SDK.
> >  Please note that this suggestion does not prevent the SDK from installing on other Linux Distributions.</value>
> >              <default></default>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

