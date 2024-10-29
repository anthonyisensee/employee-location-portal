create table "public"."Employee" (
    "id" uuid not null default gen_random_uuid(),
    "first_name" text,
    "last_name" text
);


create table "public"."LocationEvents" (
    "id" uuid not null default gen_random_uuid(),
    "created_at" timestamp with time zone not null default now(),
    "employee_id" uuid not null,
    "location_id" uuid not null default gen_random_uuid()
);


create table "public"."Locations" (
    "id" uuid not null default gen_random_uuid(),
    "name" text not null
);


CREATE UNIQUE INDEX "Employee_pkey" ON public."Employee" USING btree (id);

CREATE UNIQUE INDEX "LocationEvents_pkey" ON public."LocationEvents" USING btree (id);

CREATE UNIQUE INDEX "Locations_name_key" ON public."Locations" USING btree (name);

CREATE UNIQUE INDEX "Locations_pkey" ON public."Locations" USING btree (id);

alter table "public"."Employee" add constraint "Employee_pkey" PRIMARY KEY using index "Employee_pkey";

alter table "public"."LocationEvents" add constraint "LocationEvents_pkey" PRIMARY KEY using index "LocationEvents_pkey";

alter table "public"."Locations" add constraint "Locations_pkey" PRIMARY KEY using index "Locations_pkey";

alter table "public"."LocationEvents" add constraint "LocationEvents_employee_id_fkey" FOREIGN KEY (employee_id) REFERENCES "Employee"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."LocationEvents" validate constraint "LocationEvents_employee_id_fkey";

alter table "public"."LocationEvents" add constraint "LocationEvents_location_id_fkey" FOREIGN KEY (location_id) REFERENCES "Locations"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."LocationEvents" validate constraint "LocationEvents_location_id_fkey";

alter table "public"."Locations" add constraint "Locations_name_key" UNIQUE using index "Locations_name_key";

grant delete on table "public"."Employee" to "anon";

grant insert on table "public"."Employee" to "anon";

grant references on table "public"."Employee" to "anon";

grant select on table "public"."Employee" to "anon";

grant trigger on table "public"."Employee" to "anon";

grant truncate on table "public"."Employee" to "anon";

grant update on table "public"."Employee" to "anon";

grant delete on table "public"."Employee" to "authenticated";

grant insert on table "public"."Employee" to "authenticated";

grant references on table "public"."Employee" to "authenticated";

grant select on table "public"."Employee" to "authenticated";

grant trigger on table "public"."Employee" to "authenticated";

grant truncate on table "public"."Employee" to "authenticated";

grant update on table "public"."Employee" to "authenticated";

grant delete on table "public"."Employee" to "service_role";

grant insert on table "public"."Employee" to "service_role";

grant references on table "public"."Employee" to "service_role";

grant select on table "public"."Employee" to "service_role";

grant trigger on table "public"."Employee" to "service_role";

grant truncate on table "public"."Employee" to "service_role";

grant update on table "public"."Employee" to "service_role";

grant delete on table "public"."LocationEvents" to "anon";

grant insert on table "public"."LocationEvents" to "anon";

grant references on table "public"."LocationEvents" to "anon";

grant select on table "public"."LocationEvents" to "anon";

grant trigger on table "public"."LocationEvents" to "anon";

grant truncate on table "public"."LocationEvents" to "anon";

grant update on table "public"."LocationEvents" to "anon";

grant delete on table "public"."LocationEvents" to "authenticated";

grant insert on table "public"."LocationEvents" to "authenticated";

grant references on table "public"."LocationEvents" to "authenticated";

grant select on table "public"."LocationEvents" to "authenticated";

grant trigger on table "public"."LocationEvents" to "authenticated";

grant truncate on table "public"."LocationEvents" to "authenticated";

grant update on table "public"."LocationEvents" to "authenticated";

grant delete on table "public"."LocationEvents" to "service_role";

grant insert on table "public"."LocationEvents" to "service_role";

grant references on table "public"."LocationEvents" to "service_role";

grant select on table "public"."LocationEvents" to "service_role";

grant trigger on table "public"."LocationEvents" to "service_role";

grant truncate on table "public"."LocationEvents" to "service_role";

grant update on table "public"."LocationEvents" to "service_role";

grant delete on table "public"."Locations" to "anon";

grant insert on table "public"."Locations" to "anon";

grant references on table "public"."Locations" to "anon";

grant select on table "public"."Locations" to "anon";

grant trigger on table "public"."Locations" to "anon";

grant truncate on table "public"."Locations" to "anon";

grant update on table "public"."Locations" to "anon";

grant delete on table "public"."Locations" to "authenticated";

grant insert on table "public"."Locations" to "authenticated";

grant references on table "public"."Locations" to "authenticated";

grant select on table "public"."Locations" to "authenticated";

grant trigger on table "public"."Locations" to "authenticated";

grant truncate on table "public"."Locations" to "authenticated";

grant update on table "public"."Locations" to "authenticated";

grant delete on table "public"."Locations" to "service_role";

grant insert on table "public"."Locations" to "service_role";

grant references on table "public"."Locations" to "service_role";

grant select on table "public"."Locations" to "service_role";

grant trigger on table "public"."Locations" to "service_role";

grant truncate on table "public"."Locations" to "service_role";

grant update on table "public"."Locations" to "service_role";


