Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E7B74520E5
	for <meta-arago@arago-project.org>;
	Wed, 13 Mar 2019 00:36:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2D0a5V9087254
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 19:36:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552437365;
	bh=4/XSOVdPsRKktegG4JVz3EK81MxGicv9VM4iggEpm4c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=S9h839q5KSyI0hvyzOFlcA7GAbi+yoJl6FcfwJJr/lZ//CkOWLOYfVEFC58hjB0G+
	VAway+wSZjpPqXwY7Ux2POtpFkGX4WI6fzZijoZwZXKBu6NsQ6hEwWCXg2cNyeUfTA
	BM/RJQlMJBjo4BN++Vy/5eSlGPITIKGYagHcK93k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2D0a4fd059081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 19:36:05 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Mar 2019 19:36:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 12 Mar 2019 19:36:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2D0a4TM003862;
	Tue, 12 Mar 2019 19:36:04 -0500
Date: Tue, 12 Mar 2019 20:36:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190313003603.GL28041@beryl>
References: <1552318790-23095-1-git-send-email-j-stiffler@ti.com>
	<1552318790-23095-4-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1552318790-23095-4-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud/rocko][PATCH 3/4] open62541: update to 0.4-dev
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
X-List-Received-Date: Wed, 13 Mar 2019 00:36:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 11, 2019 at 11:39:49AM -0400, Jacob Stiffler wrote:
> * Switch to master branch (0.4-dev) for PUBSUB support.
> * git-submodules are now required to build.

git-submodules fetcher in bitbake is not very stable. There were discussions 
upstream about some breakage and corner cases, etc.

First of all - are there specific recipes for any of those submodules? If so, 
those should probably be proper dependencies.

If not, can they be listed in SRC_URI individually? I.e. multiple git:// 
entries instead of a single gitsm:// entry.

-- 
Denys

> * Add and enable packageconfig for pubsub.
> * Disable build optimizations to work around "strict-overflow" error
>   in unit tests.
> * Patch typing of size_t vars to fix armv7 builds.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  ...examples-client-allow-configurable-server.patch | 15 ++---
>  ...0001-tests-fix-typing-of-size_t-in-printf.patch | 64 ++++++++++++++++++++++
>  .../open62541/open62541_git.bb                     | 37 +++++++++----
>  3 files changed, 98 insertions(+), 18 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
> 
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> index 1cf89a9..97d241e 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
> @@ -1,6 +1,6 @@
> -From da2b9a741c3116a7774989f6338976c00a4c0496 Mon Sep 17 00:00:00 2001
> +From 69a658e534ff484faebe72fa7d1b6d484e49e7cd Mon Sep 17 00:00:00 2001
>  From: Jacob Stiffler <j-stiffler@ti.com>
> -Date: Wed, 28 Nov 2018 14:31:22 -0500
> +Date: Wed, 27 Feb 2019 11:08:32 -0500
>  Subject: [PATCH] examples: client: allow configurable server
>  
>  * Enable a remote server URL to be provided as an argument.
> @@ -14,10 +14,10 @@ Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>   1 file changed, 8 insertions(+), 3 deletions(-)
>  
>  diff --git a/examples/client.c b/examples/client.c
> -index c3147b7..90ab1c7 100644
> +index f04bed9..dfc56f5 100644
>  --- a/examples/client.c
>  +++ b/examples/client.c
> -@@ -25,12 +25,17 @@ nodeIter(UA_NodeId childId, UA_Boolean isInverse, UA_NodeId referenceTypeId, voi
> +@@ -29,13 +29,18 @@ nodeIter(UA_NodeId childId, UA_Boolean isInverse, UA_NodeId referenceTypeId, voi
>   }
>   
>   int main(int argc, char *argv[]) {
> @@ -26,7 +26,8 @@ index c3147b7..90ab1c7 100644
>  +        ua_server = argv[1];
>  +    }
>  +
> -     UA_Client *client = UA_Client_new(UA_ClientConfig_default);
> +     UA_Client *client = UA_Client_new();
> +     UA_ClientConfig_setDefault(UA_Client_getConfig(client));
>   
>       /* Listing endpoints */
>       UA_EndpointDescription* endpointArray = NULL;
> @@ -36,7 +37,7 @@ index c3147b7..90ab1c7 100644
>                                                     &endpointArraySize, &endpointArray);
>       if(retval != UA_STATUSCODE_GOOD) {
>           UA_Array_delete(endpointArray, endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
> -@@ -46,8 +51,8 @@ int main(int argc, char *argv[]) {
> +@@ -51,8 +56,8 @@ int main(int argc, char *argv[]) {
>       UA_Array_delete(endpointArray,endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
>   
>       /* Connect to a server */
> @@ -46,7 +47,7 @@ index c3147b7..90ab1c7 100644
>  +    retval = UA_Client_connect_username(client, ua_server, "user1", "password");
>       if(retval != UA_STATUSCODE_GOOD) {
>           UA_Client_delete(client);
> -         return (int)retval;
> +         return EXIT_FAILURE;
>  -- 
>  2.7.4
>  
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
> new file mode 100644
> index 0000000..21f7a16
> --- /dev/null
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-tests-fix-typing-of-size_t-in-printf.patch
> @@ -0,0 +1,64 @@
> +From c04171fb423c16f1aa9ad31d6f95e95b54b6f26f Mon Sep 17 00:00:00 2001
> +From: Jacob Stiffler <j-stiffler@ti.com>
> +Date: Wed, 9 Jan 2019 08:31:27 -0500
> +Subject: [PATCH] tests: fix typing of size_t in printf
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> +---
> + tests/check_timer.c                         | 2 +-
> + tests/server/check_server_historical_data.c | 8 ++++----
> + 2 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/check_timer.c b/tests/check_timer.c
> +index 051f1bc..1021cf4 100644
> +--- a/tests/check_timer.c
> ++++ b/tests/check_timer.c
> +@@ -52,7 +52,7 @@ START_TEST(benchmarkTimer) {
> +     clock_t finish = clock();
> +     double time_spent = (double)(finish - begin) / CLOCKS_PER_SEC;
> +     printf("duration was %f s\n", time_spent);
> +-    printf("%lu callbacks\n", count);
> ++    printf("%lu callbacks\n", (long unsigned)count);
> + 
> +     UA_Timer_deleteMembers(&timer);
> + } END_TEST
> +diff --git a/tests/server/check_server_historical_data.c b/tests/server/check_server_historical_data.c
> +index 8f16089..0dfcba0 100644
> +--- a/tests/server/check_server_historical_data.c
> ++++ b/tests/server/check_server_historical_data.c
> +@@ -325,7 +325,7 @@ testHistoricalDataBackend(size_t maxResponseSize)
> +     UA_UInt32 retval = 0;
> +     size_t i = 0;
> +     testTuple *current = &testRequests[i];
> +-    fprintf(stderr, "Testing with maxResponseSize of %lu\n", maxResponseSize);
> ++    fprintf(stderr, "Testing with maxResponseSize of %lu\n", (long unsigned)maxResponseSize);
> +     fprintf(stderr, "Start | End  | numValuesPerNode | returnBounds |ContPoint| {Expected}{Result} Result\n");
> +     fprintf(stderr, "------+------+------------------+--------------+---------+----------------\n");
> +     size_t j;
> +@@ -372,7 +372,7 @@ testHistoricalDataBackend(size_t maxResponseSize)
> +             ++counter;
> + 
> +             if(response.resultsSize != 1) {
> +-                fprintf(stderr, "ResultError:Size %lu %s", response.resultsSize, UA_StatusCode_name(response.responseHeader.serviceResult));
> ++                fprintf(stderr, "ResultError:Size %lu %s", (long unsigned)response.resultsSize, UA_StatusCode_name(response.responseHeader.serviceResult));
> +                 readOk = false;
> +                 UA_HistoryReadResponse_deleteMembers(&response);
> +                 break;
> +@@ -465,10 +465,10 @@ testHistoricalDataBackend(size_t maxResponseSize)
> +         }
> +         UA_ByteString_deleteMembers(&continuous);
> +         if (!readOk) {
> +-            fprintf(stderr, "} Fail (%lu requests)\n", counter);
> ++            fprintf(stderr, "} Fail (%lu requests)\n", (long unsigned)counter);
> +             ++retval;
> +         } else {
> +-            fprintf(stderr, "} OK (%lu requests)\n", counter);
> ++            fprintf(stderr, "} OK (%lu requests)\n", (long unsigned)counter);
> +         }
> +         current = &testRequests[++i];
> +     }
> +-- 
> +2.7.4
> +
> diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> index 1166e26..9539d83 100644
> --- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> +++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
> @@ -4,13 +4,14 @@ LICENSE = "MPL-2.0"
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
>  
> -SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
> -           file://0001-examples-client-allow-configurable-server.patch"
> +SRC_URI = "gitsm://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
> +           file://0001-examples-client-allow-configurable-server.patch \
> +           file://0001-tests-fix-typing-of-size_t-in-printf.patch"
>  
> -BRANCH = "0.3"
> -SRCREV = "9f46963240854d9a65d1784a3d2d8440c70157e8"
> +BRANCH = "master"
> +SRCREV = "7ea5a142bac44d5de7554938360e431d34fe2f59"
>  
> -PV = "0.3-rc4+git${SRCPV}"
> +PV = "0.4-dev+git${SRCPV}"
>  
>  inherit cmake python3native
>  
> @@ -20,17 +21,30 @@ S = "${WORKDIR}/git"
>  
>  EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1 -DUA_BUILD_UNIT_TESTS=1"
>  
> +# Disable BUILD_OPTIMIZATION as unittests fail due to "strict-overflow"
> +DEBUG_BUILD = "1"
> +BUILD_OPTIMIZATION = ""
> +EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Debug"
> +
> +# Or disable unittests
> +#EXTRA_OECMAKE += "-DUA_BUILD_UNIT_TESTS=0"
> +
>  PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
>  PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
> +PACKAGECONFIG[pubsub] = "-DUA_ENABLE_PUBSUB=1,-DUA_ENABLE_PUBSUB=0,,"
> +PACKAGECONFIG[pubsub_uadp] = "-DUA_ENABLE_PUBSUB_ETH_UADP=1,-DUA_ENABLE_PUBSUB_ETH_UADP=0,,"
> +PACKAGECONFIG[pubsub_delta_frames] = "-DUA_ENABLE_PUBSUB_DELTAFRAMES=1,-DUA_ENABLE_PUBSUB_DELTAFRAMES=0,,"
> +PACKAGECONFIG[pubsub_informationmodel] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=0,,"
> +PACKAGECONFIG[pubsub_informationmodel_methods] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=0,,"
> +PACKAGECONFIG[subscription_events] = "-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=1,-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=0,,"
>  
> -# Current mbedtls is not sufficient.
> -PACKAGECONFIG ?= ""
> +PACKAGECONFIG[certificate] = "-DUA_BUILD_SELFSIGNED_CERTIFICATE=1,-DUA_BUILD_SELFSIGNED_CERTIFICATE=0,,"
>  
> -do_install_append() {
> -    # header file is not installed by default
> -    install -d ${D}${includedir}
> -    install -m 644 ${B}/open62541.h ${D}${includedir}
> +PACKAGECONFIG ?= "pubsub pubsub_delta_frames pubsub_informationmodel \
> +                  pubsub_informationmodel_methods pubsub_uadp"
>  
> +# Install examples and unit tests
> +do_install_append() {
>      # Install examples
>      install -d "${D}${datadir}/${BPN}/examples"
>      for example in ${B}/bin/examples/*
> @@ -53,5 +67,6 @@ FILES_${PN}-tests += "${datadir}/${BPN}/tests"
>  
>  # Allow staticdev package to be empty incase sharedlibs is switched on
>  ALLOW_EMPTY_${PN}-staticdev = "1"
> +ALLOW_EMPTY_${PN}-tests = "1"
>  
>  BBCLASSEXTEND = "native nativesdk"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

